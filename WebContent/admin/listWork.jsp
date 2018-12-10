<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
	$(function() {
		$("#addForm").submit(function() {
			if (!checkEmpty("name", "姓名"))
				return false;
			if (!checkEmpty("sex", "性别"))
 				return false;
			if (!checkEmpty("age", "年龄"))
				return false;
			if (!checkEmpty("iphone", "手机号"))
				return false; 
			if (!checkEmpty("workage", "工龄"))
				return false;
			if (!checkEmpty("shenfen", "身份证号"))
				return false;
			if (!checkEmpty("address", "地址"))
				return false;
			if (!checkIphone("iphone","手机号"))
				return false;
			if (!checkShenfen("shenfen","身份证号"))
				return false;
			return true;
		});
	});
	
</script>

<title>业务类型管理</title>


<div class="workingArea">

	<ol class="breadcrumb">
	  <li><a href="admin_work_list">所有人员</a></li>
	</ol>



	<div class="listDataTableDiv">
		<table
			class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<td align="center">ID</td>
					<td align="center">年龄</td>
					<td align="center">性别</td>
					<td align="center">年龄</td>
					<td align="center">身份证</td>
					<td align="center">电话号</td>
					<td align="center">地址</td>
					<td align="center">工龄</td>
					<td align="center">特长</td>
					<td width="42px">删除</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ws}" var="w">
					<tr>
						<td align="center">${w.id}</td>
						<td align="center">${w.name}</td>
						<td align="center">${w.sex}</td>
						<td align="center">${w.age}</td>
						<td align="center">${w.shenfen}</td>
						<td align="center">${w.iphone}</td>
					    <td align="center">${w.address}</td>
						<td align="center">${w.workage}</td>
						<td align="center">${w.good}</td>					
						<td align="center"><a deleteLink="true"
							href="admin_work_delete?id=${w.id}"><span
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
		<div class="panel-heading">新增员工</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="admin_work_add">
				<table class="addTable">
					<tr>
						<td>姓名</td>
						<td><input id="name" name="name" type="text" 
							class="form-control"></td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
							<div class="radio"><label>
      							<input type="radio" name="sex" id="sex" value="男" checked> 男 </label>
      							 <label><input type="radio" name="sex" id="sex" value="女"> 女</label>
      						</div>
						</td>
					</tr>
					<tr>
						<td>年龄</td>
						<td><input id="age" name="age" type="text"
							class="form-control"></td>
					</tr>
					<tr>
						<td>电话</td>
						<td><input id="iphone" name="iphone" type="text"
							class="form-control"></td>
					</tr>
					<tr>
						<td>身份证</td>
						<td><input id="shenfen" name="shenfen" type="text"
							class="form-control"></td>
					</tr>
					<tr>
						<td>工龄</td>
						<td><input id="workage" name="workage" type="text"
							class="form-control"></td>
					</tr>
					<tr>
						<td>特长</td>
						<td><input id="good" name="good" type="text"
							class="form-control"></td>
					</tr>
					<tr>
						<td>地址</td>
						<td><input id="address" name="address" type="text"
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
