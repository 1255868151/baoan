<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑业务</title>
<script>
$(function() {
	$("#editForm").submit(function() {
		if (!checkEmpty("name", "业务名称"))
			return false;
			if (!checkEmpty("subTitle", "小标题"))
				return false;
		return true;
	});
});
</script>
</head>
<body>
	<div class="workingArea">
	<div class="panel panel-warning editDiv">
		<div class="panel-heading">编辑业务</div>
		<div class="panel-body">
			<form method="post" id="editForm" action="admin_business_update">
				<table class="editTable">
					<tr>
						<td>业务名称</td>
						<td><input id="name" name="name" value="${ps1.name}"
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>小标题</td>
						<td><input id="subTitle" name="subTitle" type="text"
						value="${ps1.subTitle}"
							class="form-control"></td>
					</tr>										
					<tr class="submitTR">
						<td colspan="2" align="center">
						<input type="hidden" name="id" value="${ps1.id}">
						<button type="submit" class="btn btn-success">提 交</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>