<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/header.jsp" %>
<%@ include file="/community/css/community_css.jsp" %>
<article>
    <form class="communityform" name="communityForm" action="zootopia.do?command=writeCommunity" method="post">
	    <div class="form"> 자유게시판 추가 </div>
	    <div class="detail">
	        <label class="writer">작성자</label>
	        <span class="nickname" name="nickname">${loginUser.nickname}</span>
	        <span class="userid" name="userid">[${loginUser.userid}]</span>
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
	        <input class="button3" type="submit" onclick="return communityCreate()" value="작성완료">
            <input class="button4" type="reset" value="작성취소" onclick="location.href='zootopia.do?command=communityBoard'">

	    </div>
	</form>
</article>

<%@ include file="/footer.jsp" %>


