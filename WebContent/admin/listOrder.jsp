<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
$(function(){
	$("button.orderPageCheckOrderItems").click(function(){
		var oid = $(this).attr("oid");
		$("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
	});
});

</script>

<title>业务管理</title>


<div class="workingArea">
	<h1 class="label label-info" >业务订单管理</h1>
	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover1  table-condensed">
			<thead>
				<tr class="success">
					<td align="center">ID</td>
					<td align="center">状态</td>
					<td width="100px">客户名称</td>
					<td align="center">创建时间</td>
					<td align="center">业务开始时间</td>
					<td align="center">业务结束时间</td>
					<td align="center" width="120px">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${os}" var="o">
					<tr>
						<td align="center">${o.id}</td>
						<td align="center">${o.statusDesc}</td>
						<td align="center">${o.user.name}</td>
						<td align="center"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td align="center"><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td align="center"><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

						<td>
							<button oid=${o.id} class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button>
							
							<c:if test="${o.status=='waitDelivery'}">
								<a href="admin_order_delivery?id=${o.id}">
									<button class="btn btn-primary btn-xs">审核</button>
								</a>							
							</c:if>
						</td>
					</tr>
					<tr class="orderPageOrderItemTR"  oid=${o.id}>
						
						<td colspan="10" align="center">

							<div  class="orderPageOrderItem">
								<table width="950px" align="center" class="orderPageOrderItemTable">
									<c:forEach items="${o.orderItems}" var="oi">
										<tr>	
											<td >
												<a href="forebusiness?pid=${oi.business.id}">
													<span>${oi.business.name}</span>
												</a>										
											</td>
										</tr>
										<tr ><td >手机号：<span>${o.mobile}</span></td></tr>
										<tr ><td >地址：<span>${o.address}</span></td></tr>
										<tr ><td >要求：<span>${o.userMessage}</span></td></tr>
									</c:forEach>
								
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
	

	
</div>

<%@include file="../include/admin/adminFooter.jsp"%>
