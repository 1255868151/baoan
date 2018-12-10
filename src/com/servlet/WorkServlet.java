package com.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Work;
import com.util.Page;

public class WorkServlet extends BaseBackServlet{
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {

		String name= request.getParameter("name");
		String sex= request.getParameter("sex");
		String age = request.getParameter("age");
		String iphone = request.getParameter("iphone");
		String shenfen = request.getParameter("shenfen");
		String address = request.getParameter("address");
		String workage = request.getParameter("workage");
		String good = request.getParameter("good");
		
		

		Work w = new Work();

		
		w.setName(name);
		w.setSex(sex);
		w.setAge(age);
		w.setShenfen(shenfen);
		w.setIphone(iphone);
		w.setWorkage(workage);
		w.setAddress(address);
		w.setGood(good);
		
		workDao.add(w);
		return "@admin_work_list";
	}

	
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		//User user = userDAO.get(id);
		workDao.delete(id);
		return "@admin_work_list";
		
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;		
	}

	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}

	
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		System.out.println("过滤，进入：WorkServlet.java");
		List<Work> ws = workDao.list(page.getStart(),page.getCount());
		int total = workDao.getTotal();
		page.setTotal(total);
		
		request.setAttribute("ws", ws);
		request.setAttribute("page", page);
		
		return "admin/listWork.jsp";
	}
}
