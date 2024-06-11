<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/admin/header.jsp" %>

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
		</div>
		<div class="container-btn">
			<div class="detailcontainer">
				<div class="content" >
					<p>${communityVO.content}</p> 
				</div>
	        </div>
	        <div class="buttondiv">
				<c:if test="${not empty adminUser.adminid}">
			        <div class="button_container">
						<input class="button3" type="button" value="목록으로" onclick="location.href='zootopia.do?command=admincommunitylist'">
				       	<input class="button1" type="button" value="수정" onclick="location.href='zootopia.do?command=admincommunityupdateform&gseq=${communityVO.gseq}'">    
				        <input class="button2" type="button" value="삭제" onclick="location.href='zootopia.do?command=admincommunitydelete&gseq=${communityVO.gseq}'">
			        </div>
				</c:if>
			</div>
		</div>
		
		<div class="comment-section">
        
        <hr style="margin-top:50px; margin-bottom:30px;">

        <h2 style="font-size:24px;">댓글 목록</h2>
	        <div class="commentslist">
	            <ul>
	                <c:forEach var="reply" items="${communityReplies}">
	                <li>
	                    <div class="comment-meta">
	                        <c:if test="${not empty reply.saveImage}">
	                            <div class="image_box">           
	                                <img src="images/${reply.saveImage}" alt="User Image">
	                            </div>
	                        </c:if>
	                        <span>작성자: ${reply.nickname}[${reply.userid}]</span>
	                    </div>
	                    <div class="comment-content">
	                        <p>${reply.content}</p>
	                    </div>
	                    <div class="comment-delete">
	                    	<img src="admin/images/deleteicon.png" onclick="location.href='zootopia.do?command=admincommunityreplydelete&grseq=${reply.grseq}'"/>
	                    </div>   
	                </li>
	                </c:forEach>
	            </ul>
	        </div>
    	</div>

</section>

<%@ include file="/community/css/community_css.jsp" %>
<%@ include file="/admin/footer.jsp" %>

