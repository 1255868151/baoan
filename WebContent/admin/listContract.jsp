<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	$("button.orderPageCheckOrderItems").click(function(){
		var oid = $(this).attr("oid");
		$("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
	});
});

</script>

<title>合同管理</title>


<div class="workingArea">
	<h1 class="label label-info" >合同管理</h1>
	<br>
	<br>
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover1  table-condensed">
			<thead>
				<tr class="success">
					<td align="center">ID</td>
					<td align="center">合同码</td>
					<td align="center">甲方</td>
					<td align="center">创建时间</td>
					<td width="100px" align="center">保安人数</td>
					<td width="100px" align="center">详情</td>
					<td width="100px" align="center">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cons}" var="cs">
					<tr>
						<td align="center">${cs.id}</td>
						<td align="center">${cs.ordercode}</td>
						<td align="center">${cs.partya}</td>
						<td align="center"><fmt:formatDate value="${cs.conDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td align="center">${cs.worknum}</td>
						<td align="center">
							<button oid=${cs.id} class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button>
						</td>
						<td align="center">
							<a href="admin_contract_edit?id=${cs.id}">
								<span class="glyphicon glyphicon-edit"></span>
							</a>
							<a deleteLink="true"href="admin_contract_delete?id=${cs.id}">
								<span class="glyphicon glyphicon-trash"></span>
							</a>
						</td>
						
					</tr>
					<tr class="orderPageOrderItemTR"  oid=${cs.id}>
						
						<td colspan="10" align="center" style="border:1px solid blue;">

							<div  class="orderPageOrderItem">
								<table width="800px" align="center" style="border:1px solid black;" class="orderPageOrderItemTable">
										<h3>保安公司业务合同</h3>
										<tr width="200px" style="border:1px solid black;">
											<td width="100px" align="center" style="border:1px solid black;">合同码：</td>
											<td colspan="3" align="center" style="border:1px solid black;"><span>${cs.ordercode}</span></td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td width="100px" align="center" style="border:1px solid black;">甲方：</td>
											<td align="center" style="border:1px solid black;"><span>${cs.partya}</span></td>
											<td width="100px" align="center" style="border:1px solid black;">乙方：</td>
											<td align="center" style="border:1px solid black;"><span>${cs.partyb}</span></td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td width="100px" align="center" style="border:1px solid black;">乙方要求：</td>
											<td colspan="3"  style="border:1px solid black;"><span>乙方在甲方的具体指导下，并在甲、乙方指定的范围内为甲方提供安全服务，完成本合同所约定的相关工作。</span></td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td width="100px" align="center" style="border:1px solid black;">保安人员：</td>
											<td colspan="3" align="center" style="border:1px solid black;"><span>(${cs.worknum})人 ，并经乙方确认。</span></td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td width="110px" align="center" style="border:1px solid black;">服务开始日期：</td>
											<td colspan="3" align="center" style="border:1px solid black;">
												<fmt:formatDate value="${cs.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td width="110px" align="center" style="border:1px solid black;">服务结束日期：</td>
											<td colspan="3" align="center" style="border:1px solid black;">
												<fmt:formatDate value="${cs.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td width="100px" align="center" style="border:1px solid black;">服务地址：</td>
											<td colspan="3" align="center" style="border:1px solid black;"><span>${cs.address}</span></td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td colspan="4" width="100px"  style="border:1px solid black;">
												在事先告知乙方并经乙方同意的情况下，甲方可根据工作需要适当调整保安的分工。
											</td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td width="100px" align="center" style="border:1px solid black;">服务费用：</td>
											<td colspan="3" align="center" style="border:1px solid black;"><span>${cs.money}元</span></td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td colspan="4" align="center" width="100px"  style="border:1px solid black;">
												甲方的权力和义务
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											1．甲方为保安人员提供必要的工作，生活条件，且包括食宿。
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											2．甲方有权对保安人员的各项工作进行监督，检查和具体指导。
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											3．甲方有权对乙方派往甲方的保安人员进行审核确认，有权要求调换不适合在甲方继续工作的保安人员。
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											4．凡因甲方本身原因，致使乙方保安人员在履行职责过程中发生的任何事故，均由甲方承担相应责任。
											</td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td colspan="4" align="center" width="100px"  style="border:1px solid black;">
												乙方的权力和义务
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											1．乙方的保安人员有权对甲方指定区域的人员及其财物等提供安全服务。
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											2．乙方应当保证其对甲方提供的服务质量，并应努力保证安排同一保安到甲方工作的连续性。
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											3．乙方不得随意更换为甲方提供服务的保安人员，如确特殊原因需要更换，提前三十天通知甲方，经甲方确认后方可更换。
											</td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td colspan="4" align="center" width="100px"  style="border:1px solid black;">
												合同变更
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											1．在不违背法律法规及国家政策的情况下，甲乙双方经协商可就合同相关部分进行变更。
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											2．乙方因工作失职造成重大损失，甲方有权随时解除合同。
											</td>
										</tr>
										<tr width="200px" >
											<td colspan="4"  width="100px" >
											3．因不可抗力或其他客观事由导致合同不能继续履行的，双方可协商解除合同。
											</td>
										</tr>
										<tr width="200px" style="border:1px solid black;">
											<td width="100px" align="center" style="border:1px solid black;">甲法定人：</td>
											<td align="center" style="border:1px solid black;"><span>${cs.aname}</span></td>
											<td width="100px" align="center" style="border:1px solid black;">乙法定人：</td>
											<td align="center" style="border:1px solid black;"><span>${cs.bname}</span></td>
										</tr>
										<tr width="200px" style="border:1px solid black;">											
											<td colspan="2" align="center" style="border:1px solid black;">
												<fmt:formatDate value="${cs.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>											
											<td colspan="2" align="center" style="border:1px solid black;">
												<fmt:formatDate value="${cs.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
										</tr>
								</table>
							</div>
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>
	
	<div class="panel panel-warning addDiv">
		<div class="panel-heading">新增合同</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="admin_contract_add">
			
				<table class="addTable">
					<tr>
						<td>合同码</td>
						<td ><input id="ordercode" name="ordercode" type="text" 
							class="form-control"></td>
					</tr>
					<tr>
						<td>甲方</td>
						<td><input id="partya" name="partya" type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>乙方</td>
						<td><input id="partyb" name="partyb" type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>保安人数</td>
						<td><input id="worknum" name="worknum" type="number" min="1"  class="form-control" value="1"></td>
					</tr>
					<tr>
						<td>开始日期</td>
						<td><input id="startDate" name="startDate" type="datetime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
							class="form-control"></td>
					</tr>
					<tr>
						<td>结束日期</td>
						<td><input id="endDate" name="startDate" type="datetime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
							class="form-control"></td>
					</tr>
					<tr>
						<td>服务地址</td>
						<td><input id="address" name="address" type="text"
							class="form-control"></td>
					</tr>
					<tr>
						<td>费用</td>
						<td><input id="money" name="money" type="number" value="5000"
							class="form-control"></td>
					</tr>
					<tr>
						<td>甲法定代表人</td>
						<td><input id="aname" name="aname" type="text"
							class="form-control"></td>
					</tr>
					<tr>
						<td>乙法定代表人</td>
						<td><input id="bname" name="bname" type="text"
							class="form-control"></td>
					</tr>
					<tr>
						<td>签订时间</td>
						<td><input id="conDate" name="conDate" type="datetime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
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
