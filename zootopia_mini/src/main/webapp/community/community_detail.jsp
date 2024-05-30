<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file ="/header.jsp" %>

<body>
    <h1>게시글 상세 내용</h1>
    <table border="1">
        <tr>
            <th>글 번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>내용</th>
            <th>추천 수</th>
            <th>작성일자</th>
        </tr>
        <c:if test="${not empty community}">
            <tr>
                <td>${community.gseq}</td>
                <td>${community.subject}</td>
                <td>${community.nickname}</td>
                <td>${community.content}</td>
                <td>${community.recommands}</td>
                <td>${community.createdate}</td>
            </tr>
        </c:if>
    </table>
</body>
<%@ include file ="/footer.jsp" %>