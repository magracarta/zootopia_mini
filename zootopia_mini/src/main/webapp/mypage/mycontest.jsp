<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<%@ include file="section/mypage_info.jsp" %>


	<form name="mypageMycontestForm">
		<div class="container">
			<div class="column">
			<h2>내 콘테스트</h2>
				<div class="contestlist">
					<c:choose>
						<c:when test="${empty contestList}">
							 <p>내가 등록한 콘테스트가 없습니다.</p>
						</c:when>
					<c:otherwise>
						<c:forEach items ="${contestList}" var="list">
							<h3>${list.subject}</h3>
							<p>${list.content}</p>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="column">
			<h2>참가중인 콘테스트</h2>
				<div class="contestlist">
					<c:forEach items="${contestmypetList}" var="list2">
						<span>${list2.subject }</span>
					</c:forEach>
					
					
				</div>
		</div>
	</form>
		
<%@ include file="css/mypage_css.jsp" %>
<%@ include file="css/mycontest.jsp" %>
<%@ include file ="../footer.jsp" %>

