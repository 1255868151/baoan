<%@page import="com.bean.Business"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="productDetailDiv" >
	<div class="productDetailTopPart">
		<a href="#nowhere" class="productDetailTopPartSelectedLink selected">业务详情</a>
		<a href="#nowhere" class="productDetailTopReviewLink">累计评价</a>
	</div>
	
	 <div class="productParamterPart">
		<div class="productParamterList">
		${ps1.subTitle}
		</div>
		<div class="productReviewItemDate"><fmt:formatDate value="${ps1.createDate}" pattern="yyyy-MM-dd"/> 创建此业务</div>
		<div style="clear:both"></div>
	</div> 
</div>