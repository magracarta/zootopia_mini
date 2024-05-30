<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="action" value="${param.address}" />
<div class="row">
   <!-- 페이지의 시작 -->
   <div class="col" style="font-size: 120%; font-weight: bold;">

      <c:if test="${paging.prev}">
         <a href="${action}&page=${paging.currentPage - 1}">◀</a>&nbsp;
      </c:if>
      <c:forEach begin="${paging.firstnum}" end="${paging.lastnum}" var="index">
         <c:if test="${index eq paging.currentPage}">
            <span style="color: red">${index}&nbsp;</span>
         </c:if>
         <c:if test="${index ne paging.currentPage}">
            <a href="${action}&page=${index}">${index}&nbsp;</a>
         </c:if>
      </c:forEach>
      <c:if test="${paging.next}">
         &nbsp;<a href="${action}&page=${paging.currentPage + 1}">▶</a>&nbsp;
      </c:if>

   </div>
</div>
<!-- 페이지의 끝 -->