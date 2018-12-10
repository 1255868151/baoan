<%@page import="java.util.List"%>
<%@page import="com.bean.Business"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${empty param.businesscount}">
	<c:set var="businesscount" scope="page" value="100"/>
</c:if>

<c:if test="${!empty param.productcount}">
	<c:set var="businesscount" scope="page" value="${param.businesscount}"/>
</c:if>

<div class="homepageCategoryProducts">
	<div class="container">
	 <div class="row clearfix"><c:forEach items="${ps}" var="p">
		<div class="col-md-6 column"><center>
			<h3>
				${p.name }
			</h3>
			<p>
				 <a class="btn" href="forebusiness?pid=${p.id}">申请</a>
			</p>
			</center>
		</div></c:forEach>
	 </div>
    </div>
	<img id="endpng" class="endpng" src="img/site/end.png">
</div>