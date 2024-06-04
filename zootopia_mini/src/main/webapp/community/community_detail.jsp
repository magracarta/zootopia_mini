<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<section>

	<article>
		<div class="header">
		    <h2>자유게시판</h2>
		    <input type="button" value="목록으로" onclick="location.href='zootopia.do?command=communityBoard'">
		</div>
		<div class="detailcontainer">
			<div class="writer" style="border-top:2px solid blueviolet;">
				<label>작성자</label><div>${communityVO.userid}</div>
			</div>
			<div class="subject" style="border-top:1px dotted blueviolet;">
				<label>제목</label><div>${communityVO.subject}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="createdate" style="border-top:1px dotted blueviolet;">
				<label>등록일</label><div><fmt:formatDate value="${communityVO.createdate}" type="date"/></div>
			</div>
			<div class="content" style="border-top:1px dotted blueviolet;">
				<label>본문 내용</label>
				<p>${communityVO.content}</p> 
				<button id="recommendButton">추천</button>
				<input type="hidden" id="gseq" value="${communityVO.gseq}">
				<span id="recommends">${communityVO.recommands}</span>
			</div>
            
        	</div>
			<div class="kind" style="border-top:1px dotted blueviolet;">
			    <label>종류</label>
			    <div>
			        <c:choose>
			            <c:when test="${communityVO.kind eq 1}">고민</c:when>
			            <c:when test="${communityVO.kind eq 2}">자랑</c:when>
			            <c:when test="${communityVO.kind eq 3}">잡담</c:when>
			            <c:otherwise>알 수 없음</c:otherwise>
			        </c:choose>
			    </div>
			</div>
			</div>	
        </div>
		<c:if test="${not empty loginUser.userid}">
		    <!-- 세션에 로그인한 사용자의 아이디가 저장되어 있는 경우 -->
		    <c:choose>
		        <c:when test="${communityVO.userid eq loginUser.userid}">
		            <!-- 게시글 작성자와 로그인한 사용자의 아이디가 일치하는 경우 -->
		            <div class="button">
		                <input type="button" value="수정" onclick="location.href='zootopia.do?command=communityUpdateForm&gseq=${communityVO.gseq}'">    
		                <input type="button" value="삭제" onclick="deleteCommunity('${communityVO.gseq}')">
		            </div>
		        </c:when>
		        <c:otherwise>
		            <!-- 게시글 작성자와 로그인한 사용자의 아이디가 일치하지 않는 경우 -->
		            <div class="button">
		                <!-- 수정 및 삭제 버튼을 숨깁니다. -->
		                <!-- 여기에 해당하는 경우에 대한 처리를 추가합니다. -->
		                <!-- 예: 스타일을 이용하여 숨김 처리 -->
		                <input type="button" value="수정" style="display: none;">
		                <input type="button" value="삭제" style="display: none;">
		            </div>
		        </c:otherwise>
		    </c:choose>
		</c:if>
			
		
	</article>

</section>

<%@ include file="/community/css/community_css.jsp" %>

<%@ include file="/footer.jsp" %>

