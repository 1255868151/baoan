package com.bean;

import java.util.Date;
import java.util.List;

public class Business {
	private String name;
	private String subTitle;
	private Date createDate;
	private int id;
	private int reviewCount;
	private int workCount;
	List<Business> business;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String toString(){
		return name;
	}
	
	public List<Business> getBusiness() {
		return business;
	}
	public void setBusiness(List<Business> business) {
		this.business = business;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getWorkCount() {
		return workCount;
	}
	public void setWorkCount(int workCount) {
		this.workCount = workCount;
	}
	
}
