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
		   			<input type="button" value="목록으로" onClick="location.href='zootopia.do?command=community_board.jsp'">	
		   		</div>	
			</form>
		</article>

	</div>

</section>
<%@ include file="/footer.jsp" %>