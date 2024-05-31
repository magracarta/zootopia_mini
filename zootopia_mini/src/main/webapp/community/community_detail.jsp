<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<section>

		<article>
			<form name="frm">
				<h2> Q & A View </h2>
				<div class="field" style="border-top:2px solid blueviolet;">
					<label>작성자</label><div>${communityVO.nickname}</div>
				</div>
				<div class="field" style="border-top:1px dotted blueviolet;">
					<label>제목</label><div>${communityVO.subject}</div>
				</div>
				<div class="field" style="border-top:1px dotted blueviolet;">
					<label>등록일</label><div><fmt:formatDate value="${communityVO.createdate}" type="date"/></div>
				</div>
				<div class="field" style="border-top:1px dotted blueviolet;">
					<label>질문내용</label><div><pre>${communityVO.content}</pre></div>
				</div>
				<div class="field" style="border-bottom:2px solid blueviolet;border-top:2px solid blueviolet;">
					<label>답변내용</label><div style="padding:10px;">${communityVO.recommands}</div>
				</div>
                <div class="btn" >
                    <c:if test="${userLoggedIn && userNickname == communityVO.nickname}">
                        <!-- 작성자와 로그인한 사용자가 동일한 경우에만 수정 및 삭제 버튼 표시 -->
                        <input type="button" value="수정" onClick="location.href='zootopia.do?command=communityWrite&gseq=${communityVO.gseq}'">
                        <input type="button" value="삭제" onclick="confirmDelete()">
                    </c:if>
                    <input type="button" value="목록으로" onClick="location.href='zootopia.do?command=community_board.jsp'">
                </div>	
			</form>
		</article>

	</div>

</section>
<%@ include file="/footer.jsp" %>