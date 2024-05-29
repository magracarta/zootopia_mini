<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        margin-bottom: 10px;
        cursor: pointer;
    }

    #post-details {
        margin-top: 20px;
        display: none;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Community</h1>
        <ul id="post-list">
            <c:forEach items="${posts}" var="post">
                <li onclick="showPostDetails(${post.gseq})">${post.subject}</li>
            </c:forEach>
        </ul>
        <div id="post-details">
            <h2 id="post-title"></h2>
            <p id="post-content"></p>
        </div>
    </div>
    <script src="community.js"></script>
</body>
</html>