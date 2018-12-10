<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
	$(function() {
		$("#addForm").submit(function() {
			if (!checkEmpty("name", "业务名称"))
				return false;
			if (!checkEmpty("subTitle", "业务简述"))
 				return false;
			return true;
		});
	});
</script>

<title>业务管理</title>


<div class="workingArea">

	<ol class="breadcrumb">
	  <li><a href="admin_business_list">所有分类</a></li>
	</ol>

	<div class="listDataTableDiv">
		<table
			class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th width="100px">业务名称</th>
					<th>业务简述</th>
					<th width="42px">编辑</th>
					<th width="42px">删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ps}" var="p">
					<tr>
						<td>${p.id}</td>
						<td  align="center">${p.name}</td>
						<td>${p.subTitle}</td>					
						<td><a href="admin_business_edit?id=${p.id}"><span
								class="glyphicon glyphicon-edit"></span></a></td>
						<td><a deleteLink="true"
							href="admin_business_delete?id=${p.id}"><span
								class="glyphicon glyphicon-trash"></span></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp"%>
	</div>

	<div class="panel panel-warning addDiv">
		<div class="panel-heading">新增业务</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="admin_business_add">
				<table class="addTable">
					<tr>
						<td>业务名称</td>
						<td><input id="name" name="name" type="text" 
							class="form-control"></td>
					</tr>
					<tr>
						<td>业务描述</td>
						<td><input id="subTitle" name="subTitle" type="text"
							class="form-control"></td>
					</tr>
					<tr class="submitTR">
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-success">提 交</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>