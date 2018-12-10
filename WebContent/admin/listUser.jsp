<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
</script>

<title>用户管理</title>


<div class="workingArea">
	<h1 class="label label-info" >用户管理</h1>

	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<td align="center">ID</td>
					<td align="center">用户名称</td>
					<td align="center">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${us}" var="u">
					<tr>
						<c:choose>
						<c:when test="${u.id == 1}">
							
								<td align="center">${u.id}</td>
								<td align="center">${u.name}</td>
								<td align="center">管理员</td>
							
						</c:when>
						<c:otherwise>
							
								<td align="center">${u.id}</td>
								<td align="center">${u.name}</td>
								<td align="center"><a href="admin_user_delete?id=${u.id}">删除</a></td>
							
						</c:otherwise>
		  				</c:choose>	
		  			</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>
	
	
</div>

<%@include file="../include/admin/adminFooter.jsp"%>
