package com.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Business;
import com.util.Page;

public class BusinessServlet extends BaseBackServlet{
public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
		
		
		String name= request.getParameter("name");
		String subTitle= request.getParameter("subTitle");
		

		Business ps1 = new Business();

		
		ps1.setName(name);
		ps1.setSubTitle(subTitle);
		

		
		businessDAO.add(ps1);
		return "@admin_business_list";
	}

	
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		businessDAO.delete(id);
		return "@admin_business_list";
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		Business ps1 = businessDAO.get(id);
		request.setAttribute("ps1", ps1);
		return "admin/editBusiness.jsp";		
	}
	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		String name= request.getParameter("name");
		String subTitle= request.getParameter("subTitle");
		
		Business ps1 = new Business();

		ps1.setName(name);
		ps1.setSubTitle(subTitle);
		ps1.setId(id);
		businessDAO.update(ps1);
		return "@admin_business_list";
	}



	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		
		
		List<Business> ps = businessDAO.list(page.getStart(),page.getCount());
		int total = businessDAO.getTotal();
		page.setTotal(total);
		
		request.setAttribute("ps", ps);
		request.setAttribute("page", page);
		
		return "admin/listBusiness.jsp";

	}
}
