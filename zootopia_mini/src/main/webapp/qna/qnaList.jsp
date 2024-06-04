<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="qna/css/qnacss.css">
<section>
    <article>
        <form>
            <ul class="qna-header">Q & A </ul>
            <div class="tb">
                <div class="row">
                    <div class="coltitle">번호</div>
                    <div class="coltitle">제목</div>
                    <div class="coltitle">작성자</div>
                    <div class="coltitle">작성일</div>
                    <div class="coltitle">답변여부</div>
                </div>
                <c:forEach items="${qnaList}" var="qnaVO">
                    <div class="row">
                        <div class="coltitle">${qnaVO.qseq}</div>
                        <div class="coltitle">
                            <a href="zootopia.do?command=qnaView&qseq=${qnaVO.qseq}">${qnaVO.subject}</a>
                        </div>
                        <div class="coltitle">${qnaVO.userid}</div>
                        <div class="coltitle"><fmt:formatDate value="${qnaVO.createdate}" type="date"/></div>
                        <div class="coltitle">
                            <c:choose>
                                <c:when test="${empty qnaVO.reply}">NO</c:when>
                                <c:otherwise>YES</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
                <c:url var="action" value="zootopia.do?command=qnaList" />
                <div class="pagination">
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
                <div class="btn-container" >
                    <input type="button" value="질문하기" onClick="location.href='zootopia.do?command=writeQnaForm'"/>
                </div>
            </div>
        </form>
    </article>
</section>

<%@ include file="../footer.jsp" %>