<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<div class="container">
	<div class="head">
	  <h1 class="title">자유게시판</h1>
	  <button class="write" onclick="location.href='zootopia.do?command=writeCommunityForm'">글 작성하기 ></button>
  	</div>
  	
  	<div class="contest-category">
	<ul>
		<li><a class="kind0" href="zootopia.do?command=communityBoard&pagenum=1">All</a></li>
		<li><a class="kind1" href="zootopia.do?command=communityBoard&kind=1&pagenum=1">고민</a></li>
		<li><a class="kind2" href="zootopia.do?command=communityBoard&kind=2&pagenum=1">자랑</a></li>
		<li><a class="kind3" href="zootopia.do?command=communityBoard&kind=3&pagenum=1">잡담</a></li>
	</ul>
</div>
<script>
let kind = location.href.split("kind=")[1] ?  location.href.split("kind=")[1].split("&")[0] : 0;
document.querySelector(".kind"+kind).classList.add("select");
</script>
 
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
	
      <c:forEach var="post" items="${subjectList}">
    <li>
        <a class="" href="javascript:void(0);" onclick="increaseViewCountAndRedirect(${post.gseq})">
            <span class="num">${post.gseq}</span>   
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
   
</c:forEach>

      <c:if test="${empty subjectList}">
        <c:forEach var="post" items="${top3Posts}">
          <li class="hottopic">
            <a class="" href="javascript:void(0);" onclick="increaseViewCountAndRedirect(${post.gseq})">
              <span class="num"><span>인기글</span></span>   	
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
                          <span class="num">${post.gseq}.</span>   
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

<jsp:include page="paging.jsp" flush="true">
  <jsp:param name="url" value="zootopia.do?command=communityBoard&kind=${kind}&search=${search}" />
  <jsp:param name="searchurl" value="communityBoard" />
  <jsp:param name="search" value="${search}" />
</jsp:include>

<%@ include file="/community/css/community_css.jsp" %>
<%@ include file="/footer.jsp" %>
