<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>	
<div class="payedDiv">
	<div class="payedTextDiv">
		<img src="img/site/paySuccess.png">
		<span>您已成功提交申请，请等待审核</span> 
		
	</div>
	<div class="payedAddressInfo">
		<ul>
			<li>服务地点：${o.address} ${o.receiver} ${o.mobile }</li>
			
			<li>马上会有工作人员同您进行联系，进行业务详情核对	</li>
		</ul>
	</div>
	
	<div class="payedSeperateLine">
	</div>
	
	<div class="warningDiv">
		<img src="img/site/warning.png">
		<b>安全提醒：</b>申请后可拨打官方电话，<span class="redColor boldWord">13948122736</span>
	</div>
</div>