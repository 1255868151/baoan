<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="productReviewDiv" >
	<div class="productReviewTopPart">
		<a  href="#nowhere" class="productReviewTopPartSelectedLink">业务详情</a>
		<a  href="#nowhere" class="selected">累计评价 <%-- <span class="productReviewTopReviewLinkNumber">${ps1.reviewCount}</span>  --%></a>
	</div>
	
		
	<div class="productReviewContentPart">
		<c:forEach items="${reviews}" var="r">
		<div class="productReviewItem">
			<div class="productReviewItemDesc">
				<div class="productReviewItemContent">
					${r.content }
				</div>
				<div class="productReviewItemDate"><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/></div>
			</div>
			<div class="productReviewItemUserInfo">			
				${r.user.anonymousName}<span class="userInfoGrayPart">（匿名）</span>
			</div>			
			<div style="clear:both"></div>
		
		</div>
		</c:forEach>
	</div>

</div>
