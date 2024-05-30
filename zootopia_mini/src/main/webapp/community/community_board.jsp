<!-- community_board.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dao.CommunityDao" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

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
        <c:forEach var="post" items="${commList}">
            <tr>
                <td>${post.gseq}</td>
                <td><a href="zootopia.do?command=communitydetail&gseq=${post.gseq}">${post.subject}</a></td>
                <td>${post.nickname}</td>
                <td>${post.recommands}</td>
                <td>${post.createdate}</td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- 페이지 번호 표시 -->
    <div class="row">
        <div class="col">
            <jsp:include page="/community/paging/paging.jsp">
                <jsp:param value="zootopia.do?command=communityBoard" name="address"/>
            </jsp:include>
        </div>
    </div>
</body>
<%@ include file="/footer.jsp" %>