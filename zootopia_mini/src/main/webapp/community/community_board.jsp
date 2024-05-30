<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dao.CommunityDao" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티</title>
</head>
<body>
    <h1>커뮤니티</h1>
    <table border="1">
        <tr>
            <th>글 번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>추천 수</th>
            <th>작성일자</th>
        </tr>
        <c:forEach var="post" items="${posts}">
            <tr>
                <td>${post.gseq}</td>
                <td><a href="zootopia.do?command=communitydetail&qseq=${post.gseq}">${post.subject}</a></td>
                <td>${post.nickname}</td>
                <td>${post.recommands}</td>
                <td>${post.createdate}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>