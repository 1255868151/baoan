package com.comparator;

import java.util.Comparator;

import com.bean.Business;


public class BusinessReviewComparator implements Comparator<Business>{

	@Override
	public int compare(Business b1, Business b2) {
		return b2.getReviewCount()-b1.getReviewCount();
	}

}
