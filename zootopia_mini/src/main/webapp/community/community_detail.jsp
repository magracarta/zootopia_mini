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
		  	     	 <c:when test="${communityVO.userid eq loginUser.userid}">
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
		
			

</section>

<%@ include file="/community/css/community_css.jsp" %>

<%@ include file="/footer.jsp" %>

