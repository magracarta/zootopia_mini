<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="zootopia_mini.zootopia.controller.dao.CommunityDao" %>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<!-- 추가된 부분: JavaScript 함수 정의 -->
<script>
    function maskLastTwoChars(userid) {
        if (userid.length <= 2) return "***"; // 아이디의 길이가 2 이하인 경우 예외 처리

        const maskedPortion = userid.substring(0, userid.length - 2); // 뒤에서 2글자를 제외한 부분을 추출
        const lastTwoChars = userid.substring(userid.length - 2); // 아이디의 뒤에서 2글자를 추출
        const maskedLastTwoChars = lastTwoChars.replace(/./g, "*"); // 별표로 치환

        return maskedPortion + maskedLastTwoChars; // 별표로 처리된 뒤의 2글자를 포함한 아이디 반환
    }
</script>

<body>
    <h1>커뮤니티</h1>
    <table border="1">
        <tr>
            <th>글 번호</th>
            <th>제목</th>
            <th>닉네임(작성자)</th>
            <th>추천 수</th>
            <th>작성일자</th>
        </tr>
        <c:forEach var="post" items="${commList}">
            <tr>
                <td>${post.gseq}</td>
                <td><a href="zootopia.do?command=communityDetail&gseq=${post.gseq}">${post.subject}</a></td>
                <td>${post.nickname}(${post.userid})</td>
                <td>${post.recommands}</td>
                <td>${post.createdate}</td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- 페이지네이션 표시 -->
    <div class="pagination-container">
        <jsp:include page="/paging/paging.jsp">
            <jsp:param name="paging" value="${paging}" />
        </jsp:include>
    </div>
    

	<div>
    <button onclick="location.href='zootopia.do?command=writeCommunityForm'">글 작성하기</button>
	</div>

</body>

<%@ include file="/footer.jsp" %>