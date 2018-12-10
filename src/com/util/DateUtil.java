/**
 * DateUtil这个日期工具类主要是用于java.util.Date类与java.sql.Timestamp 类的互相转换
因为在实体类中日期类型的属，使用的都是java.util.Date类?
而为了在MySQL中的日期格式里保存时间信息，必须使用datetime类型的字段，
而jdbc要获取datetime类型字段的信息，要采用java.sql.Timescom.util
否则只会保留日期信息，丢失时间信息?
 */
package com.util;

public class DateUtil {

	public static java.sql.Timestamp d2t(java.util.Date d) {
		if (null == d)
			return null;
		return new java.sql.Timestamp(d.getTime());
	}

	public static java.util.Date t2d(java.sql.Timestamp t) {
		if (null == t)
			return null;
		return new java.util.Date(t.getTime());
	}
}
