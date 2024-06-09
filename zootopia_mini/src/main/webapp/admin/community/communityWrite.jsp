<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/admin/header.jsp" %>
<%@ include file="/community/css/community_css.jsp" %>
<article>
    <form class="communityform" name="communityForm" action="zootopia.do?command=admincommunitywrite" method="post" onsubmit="return validateForm()">
        <div class="form"> 자유게시판 양식 </div>
        <div class="detail">
            <label class="writer">작성자</label>
            <span class="userid" name="userid">[${adminUser.adminid}]</span>
       </div>
       <div class="kind">     
            <label>카테고리 선택</label>
            <select class="kindlist" name="kind">
                <option class="list1" value="1">고민</option>
                <option class="list2" value="2">자랑</option>
                <option class="list3" value="3">잡담</option>
            </select>
        </div>
        <div class="class">    
            <label>제목</label>
            <input type="text" name="subject" />
        </div>
        <div class="content">
            <label>내용</label>
            <textarea class="content" name="content" rows="10" cols="85"></textarea>
		</div>
        <div class="btn">
			<input class="button3" type="submit" value="작성완료" onclick="location.href='zootopia.do?command=admincommunitylist'">
			<input class="button4" type="button" value="작성취소" onclick="cancel()">
        </div>
    </form>
</article>

<%@ include file="/admin/footer.jsp" %>
