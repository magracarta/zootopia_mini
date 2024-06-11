<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/admin/header.jsp" %>

<form method="post" name="frm">
	<div class="comlist">
		<div class="head" style="margin-bottom:50px;">
		  <h1 class="title" style="font-size:32px;">커뮤니티 관리</h1>
	  	</div>
	  	<div class="col-search">
		 <img style="width:40px; height:38px; border-bottom:1px solid #C9C9C9; 
		  padding:0; margin:0;" 
		  src="admin/images/search.png"
		  onClick="go_search('admincommunitylist')"/>
		 <input type="text" name="key" value="${key}" placeholder="글 제목"/>
		</div>
		<div class="kind-buttons">
   			<ul>
   				<li><a class="kind0" href="zootopia.do?command=admincommunitylist&pagenum=1">모든 게시글</a></li>
			    <li><a class="kind1" href="zootopia.do?command=admincommunitylist&kind=1&pagenum=1">고민</a></li>
			    <li><a class="kind2" href="zootopia.do?command=admincommunitylist&kind=2&pagenum=1">자랑</a></li>
			    <li><a class="kind3" href="zootopia.do?command=admincommunitylist&kind=3&pagenum=1">잡담</a></li>
   			</ul>
   		</div>
	   <div class="communityboard">
	    <ul>
	      <li class="board_head" style="background:white; border-bottom:1px solid #676767; font-weight:bold;">
	        <span class="num" style="text-align:center; width:15%;">no.</span>   	
	        <span class="subject" style="width:50%">[분류]제목</span>			
	        <span class="userid">닉네임[작성자]</span>			
	        <span class="createdate">작성일</span>			
	        <span class="recommands">추천수</span>			
	        <span class="vcount">조회수</span>			
	      </li>
	
	      <!-- 검색 결과가 있을 경우 해당 블록 표시 -->
	<c:forEach var="post" items="${subjectList}">
	    <li>
	        <a class="border-content" href="javascript:void(0);" onclick="increaseViewCountAndRedirect(${post.gseq})">
	            <span class="num">no.${post.gseq}</span>   
	            <span class="subject">
	                <c:choose>
	                    <c:when test="${post.kind == 1}">[고민]</c:when>
	                    <c:when test="${post.kind == 2}">[자랑]</c:when>
	                    <c:when test="${post.kind == 3}">[잡담]</c:when>
	                    <c:otherwise></c:otherwise>
	                </c:choose>
	                ${post.subject}
	            </span>            
	            <span class="userid">${post.userid}</span>         
	            <span class="createdate">${post.createdate}</span>         
	            <span class="recommands">${post.recommands}</span>        
	            <span class="vcount">${post.vcount}</span>         
	        </a>
	    </li>
	    <div class="detailcontainer">
			<div class="content" >
				<p>${communityVO.content}</p> 
				<input class="button3" type="button" value="목록으로" onclick="location.href='zootopia.do?command=admincommunitylist'">
			</div>
	    </div>
	</c:forEach>
	
	
	      <c:if test="${empty subjectList}">
	        <c:forEach var="post" items="${top3Posts}">
	          <li class="hottopic">
	            <a class="" href="javascript:void(0);" onclick="location.href='zootopia.do?command=admincommunitydetail&gseq=${post.gseq}'">
	              <span class="num">no.${post.gseq}</span>   	
	              <span class="subject">
	                <c:choose>
	                  <c:when test="${post.kind == 1}">[고민]</c:when>
	                  <c:when test="${post.kind == 2}">[자랑]</c:when>
	                  <c:when test="${post.kind == 3}">[잡담]</c:when>
	                  <c:otherwise></c:otherwise>
	                </c:choose>
	                ${post.subject}
	              </span>			
	              <span class="userid">${post.nickname}[${post.userid}]</span>			
	              <span class="createdate">${post.createdate}</span>			
	              <span class="recommands">${post.recommands}</span>			
	              <span class="vcount">${post.vcount}</span>			
	            </a>
	          </li>
	        </c:forEach>
	        <c:forEach var="post" items="${commList}">
	          <li>
	            <a class="" href="javascript:void(0);" onclick="location.href='zootopia.do?command=admincommunitydetail&gseq=${post.gseq}'">
	              <span class="num">no.${post.gseq}</span>   	
	              <span class="subject">
	                <c:choose>
	                  <c:when test="${post.kind == 1}">[고민]</c:when>
	                  <c:when test="${post.kind == 2}">[자랑]</c:when>
	                  <c:when test="${post.kind == 3}">[잡담]</c:when>
	                  <c:otherwise></c:otherwise>
	                </c:choose>
	                ${post.subject}
	              </span>			
	              <span class="userid">${post.nickname}[${post.userid}]</span>			
	              <span class="createdate">${post.createdate}</span>			
	              <span class="recommands">${post.recommands}</span>			
	              <span class="vcount">${post.vcount}</span>			
	            </a>
	          </li>
	        </c:forEach>
	      </c:if>
	    </ul>
	  </div>
	</div>
</form>
<div class="pagination"></div>
<jsp:include page="/admin/paging/paging.jsp" flush="true">
  <jsp:param name="url" value="zootopia.do?command=admincommunitylist" />
</jsp:include>


<style>
	.pagination{display:flex; justify-content:center; align-items:center; padding:10px 0;}
	.col-search{ display:flex; flex-direction:row; justify-content:flex-end; margin-bottom:80px; }
	.col-search img:hover{cursor:pointer;}
	.col-search input[type='text'] { width:200px; height:39.9px; border-top:0; border-left:0; border-right:0; border-bottom:1px solid #C9C9C9;}
	.border-container .num{text-align:center; width:15%;}
	.border-container .subject{width:50%;}
</style>
<%@ include file="/community/css/community_css.jsp" %>
<%@ include file="/admin/footer.jsp" %>
