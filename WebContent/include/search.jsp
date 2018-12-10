<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<a href="${contextPath}"> <%--首页路径 --%>
		 <img id="logo" src="img/site/logo.gif" class="logo">
	</a>
	
	<form action="foresearch" method="post" >	
		<div class="searchDiv">
			<input name="keyword" type="text" value="${param.keyword}" placeholder="私人保镖 ">
			<button  type="submit" class="searchButton">搜索</button>
			<div class="searchBelow">
				<c:forEach items="${ps}" var="c" varStatus="st">
					<c:if test="${st.count>=5 and st.count<=8}">
						<span>
							<a href="forebusiness?pid=${c.id}">
								${c.name}
							</a>
							<c:if test="${st.count!=8}">				
								<span>|</span>				
							</c:if>
						</span>			
					</c:if>
				</c:forEach>		
			</div>
		</div>
	</form>	
