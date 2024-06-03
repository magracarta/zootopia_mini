<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<section>

	<article>
		
			<h2> 자유게시판 </h2>
			<div class="field" style="border-top:2px solid blueviolet;">
				<label>작성자</label><div>${cvo.userid}</div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
				<label>제목</label><div>${cvo.subject}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div></div><span id="recommends_${cvo.gseq}">${cvo.recommands}</span> <!-- 추천 수가 표시될 위치 -->
				</div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
				<label>등록일</label><div><fmt:formatDate value="${cvo.createdate}" type="date"/></div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
				<label>본문 내용</label><div><pre>${cvo.content}</pre>        
				<button onclick="recommend('${cvo.gseq}')">추천</button>
				<button onclick>비추천</button></div>
				
			</div>
			<%-- <div class="field" style="border-bottom:2px solid blueviolet;border-top:2px solid blueviolet;">
            <label>댓글</label>
            <div style="padding:10px;">
                <!-- 댓글 입력 폼 -->
                <form action="zootopia.do?command=recommendWrite" method="post">
                    <input type="hidden" name="gseq" value="${communityVO.gseq}">
                    <textarea name="comment" placeholder="댓글을 입력하세요"></textarea>
                    <input type="submit" value="댓글 작성">
                </form>
                <!-- 댓글 목록 -->
                <ul>
                    <c:forEach var="comment" items="${communityVO.comments}">
                        <li>${comment}</li>
                    </c:forEach>
                </ul>
            </div> --%>
        </div>
			<div class="btn">
			    <input type="submit" value="수정" onclick="location.href='zootopia.do?command=communityUpdate&gseq=${cvo.gseq}'">
			    <input type="button" value="삭제" onclick="deleteProduct('${cvo.gseq}')">
			    <input type="button" value="목록으로" onclick="location.href='zootopia.do?command=communityBoard'">
			</div>
		</form>
	</article>

</section>

<script src="script/community.js"></script>

<%@ include file="/footer.jsp" %>

