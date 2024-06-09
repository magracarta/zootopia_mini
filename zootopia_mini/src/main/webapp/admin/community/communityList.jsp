<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/admin/header.jsp" %>

<div class="comlist">
	<div class="head" style="margin-bottom:50px;">
	  <h1 class="title" style="font-size:32px;">커뮤니티 관리</h1>
	  <button class="write" onclick="location.href='zootopia.do?command=admincommunitywriteform'">글 작성하기</button>
  	</div>
  <div class="communityboard">
    <ul>
      <li class="board_head">
        <span class="num">no.</span>   	
        <span class="subject">[분류]제목</span>			
        <span class="userid">닉네임[작성자]</span>			
        <span class="createdate">작성일</span>			
        <span class="recommands">추천수</span>			
        <span class="vcount">조회수</span>			
      </li>

      <!-- 검색 결과가 있을 경우 해당 블록 표시 -->
      <c:forEach var="post" items="${subjectList}">
    <li>
        <a class="" href="javascript:void(0);" onclick="increaseViewCountAndRedirect(${post.gseq})">
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
<jsp:include page="/admin/paging/paging.jsp" flush="true">
  <jsp:param name="url" value="zootopia.do?command=admincommunitylist" />
  <jsp:param name="searchurl" value="findCommunity" />
  <jsp:param name="search" value="${search}" />
</jsp:include>


<%@ include file="/community/css/community_css.jsp" %>
<%@ include file="/admin/footer.jsp" %>
