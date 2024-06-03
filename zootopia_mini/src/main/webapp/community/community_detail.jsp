<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<section>

	<article>
		
			<h2> 자유게시판 </h2>
			<div class="field" style="border-top:2px solid blueviolet;">
				<label>작성자</label><div>${communityVO.userid}</div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
				<label>제목</label><div>${communityVO.subject}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div></div><span id="recommends_${communityVO.gseq}">${communityVO.recommands}</span> <!-- 추천 수가 표시될 위치 -->
				</div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
				<label>등록일</label><div><fmt:formatDate value="${communityVO.createdate}" type="date"/></div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
				<label>본문 내용</label><div><pre>${communityVO.content}</pre>        
				<button onclick="recommend('${communityVO.gseq}')">추천</button>
				<button onclick>비추천</button></div>
				
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
			    <label>종류</label>
			    <div>
			        <c:choose>
			            <c:when test="${communityVO.kind eq 1}">고민</c:when>
			            <c:when test="${communityVO.kind eq 2}">자랑</c:when>
			            <c:when test="${communityVO.kind eq 3}">잡담</c:when>
			            <c:otherwise>알 수 없음</c:otherwise>
			        </c:choose>
			    </div>
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
			    <input type="submit" value="수정" onclick="location.href='zootopia.do?command=communityUpdateForm&gseq=${communityVO.gseq}'">    
				<input type="button" value="삭제" onclick="deleteCommunity('${communityVO.gseq}')">
				<input type="button" value="목록으로" onclick="location.href='zootopia.do?command=communityBoard'">
			</div>
		</form>
	</article>

</section>


<%@ include file="/footer.jsp" %>

