<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>


<div class="container mx-auto px-4 py-8">
  <h1 class="text-3xl font-bold mb-6">자유게시판</h1>
  <div class="relative w-full overflow-auto">
    <table class="w-full caption-bottom text-sm">
      <thead class="[&amp;_tr]:border-b">
        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
          <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
            no
          </th>
          <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
            [분류]제목
          </th>
          <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
            닉네임[작성자]
          </th>
          <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
            작성일
          </th>
          <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
            추천수
          </th>
          <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
            조회수
          </th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="post" items="${commList}">
          <tr>
            <td>
			    <a class="text-blue-600" href="javascript:void(0);" onclick="increaseViewCountAndRedirect(${post.gseq})">
			        <c:choose>
			            <c:when test="${post.kind == 1}">[고민]</c:when>
			            <c:when test="${post.kind == 2}">[자랑]</c:when>
			            <c:when test="${post.kind == 3}">[잡담]</c:when>
			            <c:otherwise></c:otherwise>
			        </c:choose>
			        ${post.subject}
			    </a>
			</td>
            <td>${post.nickname}[${post.userid}]</td>
            <td>${post.createdate}</td>
            <td>${post.recommands}</td>
            <td>${post.vcount}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<jsp:include page="paging.jsp" flush="true">
  <jsp:param name="url" value="communityBoard" />
  <jsp:param name="search" value="${searchResult}" />
</jsp:include>

    <div>
        <button onclick="location.href='zootopia.do?command=writeCommunityForm'">글 작성하기</button>
    </div>

<%@ include file="/footer.jsp" %>
