<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

	
<script>
$(function(){
	
	<c:if test="${!empty msg}">
	$("span.errorMessage").html("${msg}");
	$("div.registerErrorMessageDiv").css("visibility","visible");		
	</c:if>
	
	$(".registerForm").submit(function(){
		if(0==$("#name").val().length){
			$("span.errorMessage").html("请输入用户名");
			$("div.registerErrorMessageDiv").css("visibility","visible");			
			return false;
		}		
		if(0==$("#password").val().length){
			$("span.errorMessage").html("请输入密码");
			$("div.registerErrorMessageDiv").css("visibility","visible");			
			return false;
		}		
		if(0==$("#repeatpassword").val().length){
			$("span.errorMessage").html("请输入重复密码");
			$("div.registerErrorMessageDiv").css("visibility","visible");			
			return false;
		}		
		if($("#password").val() !=$("#repeatpassword").val()){
			$("span.errorMessage").html("重复密码不一致");
			$("div.registerErrorMessageDiv").css("visibility","visible");			
			return false;
		}		

		return true;
	});
	
	var left = window.innerWidth/2-160;
	$("div.loginSmallDiv").css("left",left); 
})
</script>


<div id="loginDiv" style="position: relative">	
	<img id="loginBackgroundImg" class="loginBackgroundImg" src="img/site/loginBackground.gif">
	
	<form class="registerForm" action="foreregister" method="post">
		<div id="loginSmallDiv" class="loginSmallDiv">
			<div class="loginErrorMessageDiv">
				<div class="alert alert-danger" >
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
				  	<span class="errorMessage"></span>
				</div>
			</div>
				
			<div class="login_acount_text">用户注册</div>
			<div class="loginInput " >
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-user"></span>
				</span>
				<input id="name" name="name" placeholder="会员名一旦设置成功，无法修改" >			
			</div>
			
			<div class="loginInput " >
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-lock"></span>
				</span>
				<input id="password" name="password" type="password"  placeholder="设置你的密码" >
			</div>
			<div class="loginInput " >
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-lock"></span>
				</span>
				<input id="repeatpassword" type="password"   placeholder="请再次输入你的密码" >
			</div>
			<div style="margin-top:20px">
				<a href="registerSuccess.jsp"><button class="btn btn-block redButton" type="submit">提交</button></a>
			</div>
		</div>	
	</form>
</div>	