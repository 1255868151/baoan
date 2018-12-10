package com.comparator;

import java.util.Comparator;

import com.bean.Business;

public class BusinessDateComparator implements Comparator<Business>{

	@Override
	public int compare(Business b1, Business b2) {
		return b1.getCreateDate().compareTo(b2.getCreateDate());
	}

}
