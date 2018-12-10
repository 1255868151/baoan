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
<script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
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
		<div class="panel-heading">编辑合同</div>
		<div class="panel-body">
			<form method="post" id="editForm" action="admin_contract_update">
				<table class="editTable">
					<tr>
						<td>合同码</td>
						<td><input id="ordercode" name="ordercode" value="${cs1.ordercode}"
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>甲方</td>
						<td><input id="partya" name="partya" value="${cs1.partya}"
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>乙方</td>
						<td><input id="partyb" name="partyb" value="${cs1.partyb}"
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>人数</td>
						<td><input id="worknum" name="worknum" value="${cs1.worknum}"
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>开始时间</td>
						<td><input id="startDate" name="startDate" value="${cs1.startDate}" type="text" 
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
							 class="form-control"></td>
					</tr>
					<tr>
						<td>结束时间</td>
						<td><input id="endDate" name="endDate" value="${cs1.endDate}"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" 
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>地址</td>
						<td><input id="address" name="address" value="${cs1.address}"
							type="text" class="form-control"></td>
					</tr>	
					<tr>
						<td>费用</td>
						<td><input id="money" name="money" value="${cs1.money}"
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>甲法人</td>
						<td><input id="aname" name="aname" value="${cs1.aname}"
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>乙法人</td>
						<td><input id="bname" name="bname" value="${cs1.bname}"
							type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>合同时间</td>
						<td><input id="conDate" name="conDate" 
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" value="${cs1.conDate}"
							type="text" class="form-control"></td>
					</tr>									
					<tr class="submitTR">
						<td colspan="2" align="center">
						<input type="hidden" name="id" value="${cs1.id}">
						<button type="submit" class="btn btn-success">提 交</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>