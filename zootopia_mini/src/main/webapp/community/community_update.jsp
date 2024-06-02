<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<section>

	<article>
		<form name="updateForm" action="zootopia.do?command=communityUpdate" method="post">
			<h2>자유게시판</h2>
			<div class="field" style="border-top: 2px solid blueviolet;">
				<label>제목</label>
				<input type="text" name="subject" value="${communityVO.subject}">
			</div>
			<div class="field" style="border-top: 1px dotted blueviolet;">
				<label>내용</label>
				<textarea name="content" rows="5" cols="50">${communityVO.content}</textarea>
			</div>
			<input type="hidden" name="gseq" value="${communityVO.gseq}">
			<label>카테고리 선택</label>
            <select name="kind">
                <option value="1">고민</option>
                <option value="2">자랑</option>
                <option value="3">잡담</option>
            </select>
			<div class="btn">
				<input type="submit" value="수정">
				<input type="button" value="삭제" onClick="deleteProduct('${communityVO.gseq}')">
				<input type="button" value="취소" onClick="location.href='zootopia.do?command=communityDetail&gseq=${communityVO.gseq}'">
			</div>
		</form>
	</article>

</section>

<script src="script/community.js"></script>

<%@ include file="/footer.jsp" %>