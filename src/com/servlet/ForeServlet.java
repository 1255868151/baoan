package com.servlet;

import java.io.BufferedWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.RandomUtils;
import org.springframework.web.util.HtmlUtils;

import com.bean.Order;
import com.bean.OrderItem;
import com.bean.Business;
import com.bean.Review;
import com.bean.User;
import com.dao.OrderDAO;
import com.dao.BusinessDAO;
import com.util.Page;

public class ForeServlet extends BaseForeServlet {
	public String home(HttpServletRequest request, HttpServletResponse response, Page page) {
		List<Business> ps= new BusinessDAO().list();
		request.setAttribute("ps", ps);
		return "home.jsp";
	}

	public String register(HttpServletRequest request, HttpServletResponse response, Page page) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		name = HtmlUtils.htmlEscape(name);
		System.out.println(name);
		boolean exist = userDAO.isExist(name);
		
		if(exist){
			request.setAttribute("msg", "用户名已经被使用,不能使用");
			return "register.jsp";	
		}
		
		User user = new User();
		user.setName(name);
		user.setPassword(password);
		System.out.println(user.getName());
		System.out.println(user.getPassword());
		userDAO.add(user);
		
		return "@registerSuccess.jsp";	
	}	
	public String login(HttpServletRequest request, HttpServletResponse response, Page page) {
		String name = request.getParameter("name");
		name = HtmlUtils.htmlEscape(name);
		String password = request.getParameter("password");		
		
		User user = userDAO.get(name,password);
		 
		if(null==user){
			request.setAttribute("msg", "账号密码错误");
			return "login.jsp";	
		}
		
		request.getSession().setAttribute("user", user);
		return "@forehome";	
	}	
	
	
	public String business(HttpServletRequest request, HttpServletResponse response, Page page) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		Business ps1 = businessDAO.get(pid);
		List<Review> reviews = reviewDAO.list(ps1.getId());		
		request.setAttribute("reviews", reviews);
		request.setAttribute("ps1", ps1);
		return "business.jsp";		
	}
	public String logout(HttpServletRequest request, HttpServletResponse response, Page page) {
		request.getSession().removeAttribute("user");
		return "@forehome";	
	}

	public String checkLogin(HttpServletRequest request, HttpServletResponse response, Page page) {
		User user =(User) request.getSession().getAttribute("user");
		if(null!=user)
			return "%success";
		return "%fail";
	}
	public String loginAjax(HttpServletRequest request, HttpServletResponse response, Page page) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");		
		User user = userDAO.get(name,password);
		
		if(null==user){
			return "%fail";	
		}/*else if ("admin"==user.getName().toString()) {
			return null;
		}*/
		request.getSession().setAttribute("user", user);
		return "%success";	
	}
	
	
	public String search(HttpServletRequest request, HttpServletResponse response, Page page){
		String keyword = request.getParameter("keyword");
		List<Business> ps= new BusinessDAO().search(keyword,0,20);
		request.setAttribute("ps",ps);
		return "searchResult.jsp";
	}

	public String buyone(HttpServletRequest request, HttpServletResponse response, Page page) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		/*int num = Integer.parseInt(request.getParameter("num"));*/
		Business ps1 = businessDAO.get(pid);
		int oiid = 0;
		
		User user =(User) request.getSession().getAttribute("user");
		boolean found = false;
		List<OrderItem> ois = orderItemDAO.listByUser(user.getId());
		for (OrderItem oi : ois) {
			if(oi.getBusiness().getId()==ps1.getId()){
				/*oi.setNumber(oi.getNumber()+num);*/
				orderItemDAO.update(oi);
				found = true;
				oiid = oi.getId();
				break;
			}
		}		

		if(!found){
			OrderItem oi = new OrderItem();
			oi.setUser(user);
			oi.setBusiness(ps1);
			orderItemDAO.add(oi);
			oiid = oi.getId();
		}
		return "@forebuy?oiid="+oiid;
	}

	
	public String buy(HttpServletRequest request, HttpServletResponse response, Page page){
		String[] oiids=request.getParameterValues("oiid");
		List<OrderItem> ois = new ArrayList<>();
		for (String strid : oiids) {
			int oiid = Integer.parseInt(strid);
			OrderItem oi= orderItemDAO.get(oiid);
			ois.add(oi);
		}
		
		request.getSession().setAttribute("ois", ois);
		return "buy.jsp";
	}	

	public String createOrder(HttpServletRequest request, HttpServletResponse response, Page page){
		User user =(User) request.getSession().getAttribute("user");

	
		String address = request.getParameter("address");
		String receiver = request.getParameter("receiver");
		String mobile = request.getParameter("mobile");
		String userMessage = request.getParameter("userMessage");
		
		
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +RandomUtils.nextInt(10000);
		Order order = new Order();
		order.setOrderCode(orderCode);
		order.setAddress(address);
	
		order.setReceiver(receiver);
		order.setMobile(mobile);
		order.setUserMessage(userMessage);
		order.setCreateDate(new Date());
		order.setUser(user);
		order.setStatus(OrderDAO.waitDelivery);

		orderDAO.add(order);

		List<OrderItem> ois= (List<OrderItem>) request.getSession().getAttribute("ois");		
		
		for (OrderItem oi: ois) {
			oi.setOrder(order);
			orderItemDAO.update(oi);
			
		}
		return "@forepayed?oid="+order.getId();
	}
	
	public String alipay(HttpServletRequest request, HttpServletResponse response, Page page){
		
		return "payed.jsp";
	}

	public String payed(HttpServletRequest request, HttpServletResponse response, Page page) {
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order order = orderDAO.get(oid);
		order.setStatus(OrderDAO.waitDelivery);
		
		new OrderDAO().update(order);
		request.setAttribute("o", order);
		return "payed.jsp";		
	}	

	public String bought(HttpServletRequest request, HttpServletResponse response, Page page) {
		User user =(User) request.getSession().getAttribute("user");
		List<Order> os= orderDAO.list(user.getId(),OrderDAO.delete);
		
		orderItemDAO.fill(os);
		
		request.setAttribute("os", os);
		
		return "bought.jsp";		
	}
	public String confirmPay(HttpServletRequest request, HttpServletResponse response, Page page) {
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderDAO.get(oid);
		orderItemDAO.fill(o);
		request.setAttribute("o", o);
		return "confirmPay.jsp";		
	}
	
	public String orderConfirmed(HttpServletRequest request, HttpServletResponse response, Page page) {
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderDAO.get(oid);
		o.setStatus(OrderDAO.waitReview);
		o.setConfirmDate(new Date());
		orderDAO.update(o);
		return "orderConfirmed.jsp";
	}	
	
	
	public String deleteOrder(HttpServletRequest request, HttpServletResponse response, Page page){
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderDAO.get(oid);
		o.setStatus(OrderDAO.delete);
		orderDAO.update(o);
		return "%success";		
	}
	public String review(HttpServletRequest request, HttpServletResponse response, Page page) {
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderDAO.get(oid);
		orderItemDAO.fill(o);
		Business ps1 = o.getOrderItems().get(0).getBusiness();
		List<Review> reviews = reviewDAO.list(ps1.getId());
		request.setAttribute("ps1", ps1);
		request.setAttribute("o", o);
		request.setAttribute("reviews", reviews);
		return "review.jsp";		
	}
	public String doreview(HttpServletRequest request, HttpServletResponse response, Page page) {
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderDAO.get(oid);
		o.setStatus(OrderDAO.finish);
		orderDAO.update(o);
		int pid = Integer.parseInt(request.getParameter("pid"));
		Business ps1 = businessDAO.get(pid);
		
		String content = request.getParameter("content");
		
		content = HtmlUtils.htmlEscape(content);

		User user =(User) request.getSession().getAttribute("user");
		Review review = new Review();
		review.setContent(content);
		review.setBusiness(ps1);
		review.setCreateDate(new Date());
		review.setUser(user);
		reviewDAO.add(review);
		
		return "@forereview?oid="+oid+"&showonly=true";		
	}
	
}

