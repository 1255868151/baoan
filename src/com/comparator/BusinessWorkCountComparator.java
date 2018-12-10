package com.comparator;

import java.util.Comparator;

import com.bean.Business;

public class BusinessWorkCountComparator implements Comparator<Business>{

	@Override
	public int compare(Business b1, Business b2) {
		return b2.getWorkCount()-b1.getWorkCount();
	}

}
