package com.bean;

import java.util.Date;

public class Contract {
	private int id;
	private String  ordercode;
	private String partya;
	private String partyb;
	private int worknum;
	private Date startDate;
	private Date endDate;
	private String address;
	private Double money;
	private String aname;
	private String bname;
	private Date conDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String  ordercode) {
		this.ordercode = ordercode;
	}
	public String getPartya() {
		return partya;
	}
	public void setPartya(String partya) {
		this.partya = partya;
	}
	public String getPartyb() {
		return partyb;
	}
	public void setPartyb(String partyb) {
		this.partyb = partyb;
	}
	public int getWorknum() {
		return worknum;
	}
	public void setWorknum(int worknum) {
		this.worknum = worknum;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Date getConDate() {
		return conDate;
	}
	public void setConDate(Date conDate) {
		this.conDate = conDate;
	}
	
	
}
