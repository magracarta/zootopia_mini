<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<body>
    <h1>커뮤니티</h1>
    <table border="1">
        <tr>
            <th>글 번호</th>
            <th>종류</th>
            <th>제목</th>
            <th>작성자</th>
            <th>아이디</th>
            <th>추천 수</th>
            <th>작성일자</th>
        </tr>
        <c:forEach var="post" items="${commList}">
            <tr>
                <td>${post.gseq}</td>
                <td>
                    <c:choose>
                        <c:when test="${post.kind == 1}">고민</c:when>
                        <c:when test="${post.kind == 2}">자랑</c:when>
                        <c:when test="${post.kind == 3}">잡담</c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                </td>
                <td><a href="zootopia.do?command=communityDetail&gseq=${post.gseq}">${post.subject}</a></td>
                <td>${post.nickname}</td>
                <td>${post.userid}</td>
                <td>${post.recommands}</td>
                <td>${post.createdate}</td>
            </tr>
        </c:forEach>
    </table>
    
    <div class="pagination-container">
        <jsp:include page="/paging/paging.jsp">
            <jsp:param name="url" value="zootopia.do?command=communityBoard" />
        </jsp:include>
    </div>
    
    <div>
        <button onclick="location.href='zootopia.do?command=writeCommunityForm'">글 작성하기</button>
    </div>
</body>

<%@ include file="/footer.jsp" %>