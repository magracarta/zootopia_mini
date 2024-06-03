<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="qna/css/qnacss.css">
<section>
    <article>
        <form>
            <ul class="qna-header">Q & A 리스트</ul>
            <div class="tb">
                <div class="row">
                    <div class="coltitle" style="width: 49px;">번호</div>
                    <div class="coltitle" style="width: 49px;">제목</div>
                    <div class="coltitle" style="width: 49px;">작성자</div>
                    <div class="coltitle" style="width: 49px;">작성일</div>
                    <div class="coltitle" style="width: 60px;">답변여부</div>
                    <div class="coltitle" style="width: 49px;">분류</div>
                </div>
                <c:forEach items="${qnaList}" var="qnaVO">
                    <div class="row">
                        <div class="col">${qnaVO.qseq}</div>
                        <div class="col">
                            <a href="zootopia.do?command=qnaView&qseq=${qnaVO.qseq}">${qnaVO.subject}</a>
                        </div>
                        <div class="col">${qnaVO.userid}</div>
                        <div class="col"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
                        <div class="col">
                            <c:choose>
                                <c:when test="${empty qnaVO.reply}">NO</c:when>
                                <c:otherwise>YES</c:otherwise>
                            </c:choose>
                        </div>
                      <%--   <div class="col">${qnaVO.category}</div> --%> <!-- qnaVO에 category 속성이 있다고 가정 -->
                    </div>
                </c:forEach>
                <c:url var="action" value="zootopia.do?command=qnaList" />
                <div class="row pagination">
                    <c:if test="${paging.prev}">
                        <a href="${action}&page=${paging.beginPage-1}">◀</a>&nbsp;
                    </c:if>
                    <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
                        <c:if test="${index == paging.page}">
                            <span>${index}&nbsp;</span>
                        </c:if>
                        <c:if test="${index != paging.page}">
                            <a href="${action}&page=${index}">${index}&nbsp;</a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${paging.next}">
                        &nbsp;<a href="${action}&page=${paging.endPage+1}">▶</a>&nbsp;
                    </c:if>
                </div>
                <div class="btn">
                    <input type="button" value="질문하기" onClick="location.href='zootopia.do?command=writeQnaForm'"/>
                </div>
            </div>
        </form>
    </article>
</section>

<%@ include file="../footer.jsp" %>