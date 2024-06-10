<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>
<%@ include file="/community/css/community_css.jsp" %>

<section>

<article>
    <form class="updateForm" name="updateForm" action="zootopia.do?command=communityUpdate" method="post">
        <h2 class="section-title">자유게시판</h2>
        <div class="field1">
            <label  for="subject">제목</label>
            <input class="subject" type="text" id="subject" name="subject" value="${communityVO.subject}">
        </div>
        <div class="field2">
            <label for="content">내용</label>
            <textarea id="content" name="content" rows="50" cols="100">${communityVO.content}</textarea>
        </div>
        <input type="hidden" name="gseq" value="${communityVO.gseq}">
        <div class="field3">
            <label for="kind">카테고리 선택</label>
            <select class="kind" id="kind" name="kind">
                <option class="1" value="1" ${communityVO.kind == 1 ? 'selected' : ''}>고민</option>
                <option class="2" value="2" ${communityVO.kind == 2 ? 'selected' : ''}>자랑</option>
                <option class="3" value="3" ${communityVO.kind == 3 ? 'selected' : ''}>잡담</option>
            </select>
        </div>
        <div class="btn-group">	
            <input type="button" class="btn1" value="수정완료" onclick="updateCommunity()">
            <input type="button" class="btn2" value="취소" onClick="location.href='zootopia.do?command=communityDetail&gseq=${communityVO.gseq}'">
        </div>
    </form>
</article>

</section>



<%@ include file="/footer.jsp" %>