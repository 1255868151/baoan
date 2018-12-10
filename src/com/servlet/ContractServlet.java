package com.servlet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Business;
import com.bean.Contract;
import com.util.Page;

public class ContractServlet extends BaseBackServlet{
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {

		String  ordercode = request.getParameter("ordercode");
		String partya = request.getParameter("partya");
		String partyb = request.getParameter("partyb");
		int worknum = Integer.parseInt(request.getParameter("worknum"));
		String address = request.getParameter("address");
		double money = Double.parseDouble(request.getParameter("money"));
		String aname = request.getParameter("aname");
		String bname = request.getParameter("bname");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = new Date();
		Date endDate = new Date();
		Date conDate = new Date();
		try{
			startDate=df.parse((String)request.getParameter("startDate"));
			endDate=df.parse((String)request.getParameter("endDate"));
			conDate=df.parse((String)request.getParameter("conDate"));
		}
		catch(Exception e){
		}
		
		Contract con = new Contract();
		
		
		
		con.setOrdercode(ordercode);
		con.setPartya(partya);
		con.setPartyb(partyb);
		con.setWorknum(worknum);
		con.setStartDate(startDate);
		con.setEndDate(endDate);
		con.setAddress(address);
		con.setMoney(money);
		con.setAname(aname);
		con.setBname(bname);
		con.setConDate(conDate);
		
		contractDao.add(con);
		return "@admin_contract_list";
	}

	
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		contractDao.delete(id);
		return "@admin_contract_list";
		
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		Contract cs1 = contractDao.get(id);
		request.setAttribute("cs1", cs1);
		return "admin/editContract.jsp";				
	}

	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		String ordercode= request.getParameter("ordercode");
		String partya= request.getParameter("partya");
		String partyb= request.getParameter("partyb");
		int worknum= Integer.valueOf(request.getParameter("partyb"));
		
		Date startDate = null;
		try {
			startDate = new SimpleDateFormat("yyyyMMddHHmmssSSS").parse(request.getParameter("startDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date endDate = null;
		try {
			endDate = new SimpleDateFormat("yyyyMMddHHmmssSSS").parse(request.getParameter("endDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String address= request.getParameter("address");
		Double money = Double.valueOf(request.getParameter("partyb"));
		String aname= request.getParameter("aname");
		String bname= request.getParameter("bname");
		Date conDate = null;
		try {
			conDate = new SimpleDateFormat("yyyyMMddHHmmssSSS").parse(request.getParameter("conDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Contract cs1 = new Contract();
		
		cs1.setOrdercode(ordercode);
		cs1.setPartya(partya);
		cs1.setPartyb(partyb);
		cs1.setWorknum(worknum);
		cs1.setStartDate(startDate);
		cs1.setEndDate(endDate);
		cs1.setAddress(address);
		cs1.setMoney(money);
		cs1.setAname(aname);
		cs1.setBname(bname);
		cs1.setConDate(conDate);
		cs1.setId(id);
		contractDao.update(cs1);
		return "@admin_contract_list";
	}

	
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		System.out.println("过滤，进入：ContractServlet.java");
		List<Contract> cons = contractDao.list(page.getStart(),page.getCount());
		int total = contractDao.getTotal();
		page.setTotal(total);		
		request.setAttribute("cons", cons);
		request.setAttribute("page", page);
		return "admin/listContract.jsp";
	}
}
