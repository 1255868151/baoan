<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="searchProducts">

	<%--搜索显示页面 --%>
	 <c:forEach items="${ps}" var="p">
	 	
	 	<div class="noMatch">
	 	<a class="productLink" href="forebusiness?pid=${p.id}">
			 ${fn:substring(p.name, 0, 50)}
			</a></div>
	</c:forEach> 
	
	<c:if test="${empty ps}">
		<div class="noMatch">没有满足条件的业务</div>
	</c:if>
	
		<div style="clear:both"></div>
</div>