<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/header.jsp" %>
<%@ include file ="css/content_css.jsp" %>

<c:forEach items ="${list}" var ="list">
	<ul>
		<li>${list.source }</li>
		<li>${list.replyContent }</li>
	</ul>
</c:forEach>

<%@ include file ="/footer.jsp" %>