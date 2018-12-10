<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="top ">
		<a href="${contextPath}">
			<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
			保安首页
		</a>	
		
		<span>欢迎来保安业务公司</span>
		
		<c:if test="${!empty user}">
		  <c:choose>
			<c:when test="${ user.id == 1}">
				<a href="login.jsp">${user.name}(管理员)</a><a href="admin/index.jsp" > <button>后台</button>  </a>
				<a href="forelogout">退出</a>	
			</c:when>
			<c:otherwise>
				<a href="login.jsp">${user.name}</a>
				<a href="forelogout">退出</a>
			</c:otherwise>
		  </c:choose>		
		</c:if>
		
		<c:if test="${empty user}">
			<a href="login.jsp">请登录</a>
			<a href="register.jsp">免费注册</a>		
		</c:if>


		<span class="pull-right">
			<a href="forebought"><span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-user redColor"></span>
			我的服务</a>
		</span>
		
		
</nav>



