package com.servlet;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ContractDAO;
import com.dao.OrderDAO;
import com.dao.OrderItemDAO;
import com.dao.BusinessDAO;
import com.dao.ReviewDAO;
import com.dao.UserDAO;
import com.dao.WorkDAO;
import com.util.Page;

public class BaseForeServlet extends HttpServlet{

	
	protected OrderDAO orderDAO = new OrderDAO();
	protected OrderItemDAO orderItemDAO = new OrderItemDAO();
	protected BusinessDAO businessDAO = new BusinessDAO();
	protected ReviewDAO reviewDAO = new ReviewDAO();
	protected UserDAO userDAO = new UserDAO();
	protected WorkDAO workDAO = new WorkDAO();
	protected ContractDAO contractDao = new ContractDAO();
	
	public void service(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("过滤，进入：BaseForeServlet.java");
			int start= 0;
			int count = 10;
			try {
				start = Integer.parseInt(request.getParameter("page.start"));
			} catch (Exception e) {
				
			}
			
			try {
				count = Integer.parseInt(request.getParameter("page.count"));
			} catch (Exception e) {
			}
			
			Page page = new Page(start,count);
			
			String method = (String) request.getAttribute("method");

			Method m = this.getClass().getMethod(method, javax.servlet.http.HttpServletRequest.class,
					javax.servlet.http.HttpServletResponse.class,Page.class);
			
			String redirect = m.invoke(this,request, response,page).toString();
			
			if(redirect.startsWith("@"))
				response.sendRedirect(redirect.substring(1));
			else if(redirect.startsWith("%"))
				response.getWriter().print(redirect.substring(1));
			else
				request.getRequestDispatcher(redirect).forward(request, response);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
}
