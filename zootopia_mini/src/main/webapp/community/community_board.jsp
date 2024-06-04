<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<div class="container">
  <h1 class="title">자유게시판</h1>
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

      <c:forEach var="post" items="${top3Posts}">
        <li class="hottopic">
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
            <span class="userid">${post.nickname}[${post.userid}]</span>			
            <span class="createdate">${post.createdate}</span>			
            <span class="recommands">${post.recommands}</span>			
            <span class="vcount">${post.vcount}</span>			
          </a>
        </li>
      </c:forEach>
      <c:forEach var="post" items="${commList}">
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
            <span class="userid">${post.nickname}[${post.userid}]</span>			
            <span class="createdate">${post.createdate}</span>			
            <span class="recommands">${post.recommands}</span>			
            <span class="vcount">${post.vcount}</span>			
          </a>
        </li>
      </c:forEach>
    </ul>
  </div>
</div>

<jsp:include page="paging.jsp" flush="true">
  <jsp:param name="url" value="zootopia.do?command=communityBoard" />
  <jsp:param name="search" value="${searchResult}" />
</jsp:include>

<%@ include file="/community/css/community_css.jsp" %>
<%@ include file="/footer.jsp" %>
             
