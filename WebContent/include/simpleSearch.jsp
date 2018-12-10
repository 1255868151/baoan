<%--业务信息展示  右上角的小型搜索框 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div >
	<a href="${contextPath}"> <%--首页路径 --%>
		<img id="simpleLogo" class="simpleLogo" src="img/site/simpleLogo.jpg">
	</a>

	<form action="foresearch" method="post" >	
	<div class="simpleSearchDiv pull-right">
	<%--根据关键字查询 --%>
		<input type="text" placeholder="服务类型"  value="${param.keyword}" name="keyword">
		<button class="searchButton" type="submit">搜服务</button>
		<div class="searchBelow">
			<c:forEach items="${ps}" var="p" varStatus="st">
				<c:if test="${st.count>=1 and st.count<=4}">
					<span>
						<a href="forebusinesspid=${p.id}">
							${p.name}
						</a>
						<c:if test="${st.count!=4}">				
							<span>|</span>				
						</c:if>
					</span>			
				</c:if>
			</c:forEach>			
		</div>
	</div>
	</form>
	<div style="clear:both"></div>
</div>