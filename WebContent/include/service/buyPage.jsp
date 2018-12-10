<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function() {
		$("#addForm").submit(function() {
			if (!checkEmpty("receiver", "姓名"))
				return false;
			if (!checkEmpty("userMessage", "要求"))
 				return false;
			if (!checkEmpty("age", "年龄"))
				return false;
			if (!checkEmpty("mobile", "手机号"))
				return false; 
			if (!checkEmpty("workage", "工龄"))
				return false;
			if (!checkEmpty("shenfen", "身份证号"))
				return false;
			if (!checkEmpty("address", "地址"))
				return false;
			if (!checkIphone("mobile","手机号"))
				return false;
			if (!checkShenfen("shenfen","身份证号"))
				return false;
			return true;
		});
	});
	
</script>
           
<div class="buyPageDiv">
  <form action="forecreateOrder" method="post" id="addForm">
	<div class="buyFlow">
		<img class="pull-left" src="img/site/flow.jpg"> 
		<div style="clear:both"></div>
	</div>
	<div class="address">
		<div class="addressTip">联系信息：</div>
		<div>
		
			<table class="addressTable">
				<tr>
					<td>客户名称<span class="redStar">*</span></td>
					<td><input id="receiver"  name="receiver"  placeholder="单位名称或个人名称" type="text"></td>
				</tr>
				<tr>
					<td class="firstColumn">服务地址<span class="redStar">*</span></td>
					
					<td><textarea id="address" name="address" placeholder="建议您如实填写详细服务地址 ，接送服务的多个地址都需要填写"></textarea></td>
				</tr>
				<tr>
					<td>手机号码 <span class="redStar">*</span></td>
					<td><input id="mobile" name="mobile"  placeholder="请输入11位手机号码" type="text"></td>
				</tr>
			</table>
			
		</div>
	</div>
	<div class="productList">
		<div class="productListTip">确认申请信息</div>
		
		
		<table class="productListTable">
			<thead>
				<tr>
					<th colspan="2" class="productListTableFirstColumn">
						<a class="wangwanglink" href="#nowhere"> </a>
					</th>
				</tr>
				<tr class="rowborder">
					<td  colspan="2" ></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody class="productListTableTbody">
				<c:forEach items="${ois}" var="oi" varStatus="st" >
					<tr class="orderItemTR">
						<td class="orderItemProductInfo">
							<a  href="forebusiness?pid=${oi.business.id}" class="orderItemProductLink">
							${oi.business.name}
							</a>
						</td>
						<td>
						</td>
						<td>
						<span class="orderItemProductNumber"></span>
						</td>
						<td><span class="orderItemUnitSum">
						</span></td>
					</tr>
				</c:forEach>				
				
			</tbody>
			
		</table>
		<div class="orderItemSumDiv">
			<div class="pull-left">
				<span class="leaveMessageText">申请留言:</span>
				<span>
					<img class="leaveMessageImg" src="img/site/leaveMessage.png">
				</span>
				<span class="leaveMessageTextareaSpan">
					<textarea id="userMessage" name="userMessage" class="leaveMessageTextarea"></textarea>
					<div>
						<span>还可以输入200个字符</span>
					</div>
				</span>
			</div>
		</div>
		

				
	
	</div>

	<div class="orderItemTotalSumDiv">
		<div class="pull-right"> 
		</div>
	</div>
	
	<div class="submitOrderDiv">
			<button type="submit" class="submitOrderButton">提交业务申请</button>
	</div>
  </form>		
</div>