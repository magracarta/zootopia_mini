<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<section >

		<div class="header">
			<div class="text">
				<div class="num">no.${communityVO.gseq}</div>      
			    <div class="top">
				    <div class="title">
			    	<c:choose>
	                    <c:when test="${communityVO.kind == 1}">[고민]</c:when>
	                    <c:when test="${communityVO.kind == 2}">[자랑]</c:when>
	                    <c:when test="${communityVO.kind == 3}">[잡담]</c:when>
	                    <c:otherwise></c:otherwise>
	                </c:choose>
	                ${communityVO.subject}
	                </div>
	                <div class="namerecomreply">
	                	<ul class="nickname">${communityVO.nickname}[${communityVO.userid}]</ul>
	                	<li class="recommands">추천 수[${communityVO.recommands}]<button class="recommendButton">추천</button>
			                <div class="content" >
			                    <input type="hidden" class="gseq" value="${communityVO.gseq}">
			                </div>
		         	   </li>
	                	<ul class="vcount">조회수:${communityVO.vcount}</ul>
	                </div>
			    </div>
			</div>
			<div class="buttondiv">
				<c:if test="${not empty loginUser.userid}">
		  		  <c:choose>
		  	     	 <c:when test="${communityVO.userid == loginUser.userid}">
		          		  <div class="button_container">
			                <input class="button1" type="button" value="수정" onclick="location.href='zootopia.do?command=communityUpdateForm&gseq=${communityVO.gseq}'">    
			                <input class="button2" type="button" value="삭제" onclick="deleteCommunity('${communityVO.gseq}')">
		           		 </div>
		        	</c:when>
		   		 </c:choose>
				</c:if>
			</div>
		</div>
		<div class="detailcontainer">
			<div class="content" >
				<p>${communityVO.content}</p> 
				<input class="button3" type="button" value="목록으로" onclick="location.href='zootopia.do?command=communityBoard'">
			</div>
        </div>
		
    <!-- 댓글 작성 폼 -->
    <h2 class="commenth2">댓글 작성</h2>
    <form class="commentwrite" action="zootopia.do?command=writeCommunityReply" method="post">
        <textarea class="write" name="content"  required></textarea>
        <input type="hidden" name="gseq" value="${communityVO.gseq}">
        <button class="submit" type="submit">작성하기</button>
    </form>
    
    
<h2>Comments</h2>
<div class="comment-list">
    <c:forEach var="reply" items="${communityReplies}">
    	<div class="commentbox">
            <div class="comment-content">
                <p>${reply.content}</p>
            </div>
            <div class="comment-meta">
                <span>작성자: ${reply.nickname}[${reply.userid}]</span>
                <span>댓글번호:${reply.grseq}</span>
                <c:if test="${loginUser.userid == reply.userid}">
			   	 <input class="delete" type="button" value="삭제" onclick="deleteCommunityReply('${reply.grseq}', '${communityVO.gseq}')">
				</c:if>
			</div>
        </div>    
    </c:forEach>
</div>
    
</section>

<%@ include file="/community/css/community_css.jsp" %>
<%@ include file="/footer.jsp" %>

