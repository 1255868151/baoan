
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<div class="reviewDiv">
	<div class="reviewProductInfoDiv">
	</div>
	<div class="reviewStasticsDiv">
		<div class="reviewStasticsLeft">
				<div class="reviewStasticsLeftTop"></div>
				<div class="reviewStasticsLeftContent">欢迎评价</div>
		</div>
		<div class="reviewStasticsRight">
			<div class="reviewStasticsRightEmpty"></div>
		</div>
	</div>		
	
	 <c:if test="${param.showonly==true}">
	<div class="reviewDivlistReviews">
		<c:forEach items="${reviews}" var="r">
			<div class="reviewDivlistReviewsEach">
				<div class="reviewDate"><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/></div>
				<div class="reviewContent">${r.content}</div>
				<div class="reviewUserInfo pull-right">${r.user.anonymousName}<span class="reviewUserInfoAnonymous">(匿名)</span></div>
			</div>
		</c:forEach>
	</div>
	</c:if> 
	
	<c:if test="${param.showonly!=true}">
		<div class="makeReviewDiv">
		<form method="post" action="foredoreview">
			<div class="makeReviewText">需要你的建议哦！</div>
			<table class="makeReviewTable">
				<tr>
					<td class="makeReviewTableFirstTD">请对本次服务评价</td>
					<td><textarea name="content"></textarea></td>
				</tr>
			</table>
			<div class="makeReviewButtonDiv">
				<input type="hidden" name="oid" value="${o.id}">
				<input type="hidden" name="pid" value="${ps1.id}">
				<button type="submit">提交评价</button>
			</div>
		</form>
		</div>	
	</c:if>

</div>