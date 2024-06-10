<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section>
    <article>
        <form>
            <ul class="qna-header">Q & A </ul>
            <div class="tb">
                <div class="row">
                    <div class="coltitle">번호</div>
                    <div class="coltitle">카테고리</div>
                    <div class="coltitle">제목</div>
                    <div class="coltitle">작성자</div>
                    <div class="coltitle">작성일</div>
                    <div class="coltitle">답변여부</div>
                </div>
                <c:if test="${not empty qnaList}">
                    <c:forEach items="${qnaList}" var="qnaVO">
                        <div class="low">
                            <div class="coltitle">${qnaVO.qseq}</div>
                            <div class="coltitle">
		                    <c:choose >
			                    <c:when test="${qnaVO.category == 1}">[콘테스트 문의]</c:when>
			                    <c:when test="${qnaVO.category == 2}">[자유게시판 문의]</c:when>
			                    <c:when test="${qnaVO.category == 3}">[기타 문의]</c:when>
			                    <c:otherwise></c:otherwise>
			                </c:choose>
			                </div>
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
                </c:if>
                <c:url var="action" value="zootopia.do?command=qnaList" />
                <div class="pagination">
                </div>
                <div class="btn-container" style="text-align: right;">
                    <input type="button" value="질문하기" onClick="location.href='zootopia.do?command=writeQnaForm'" style="height:40px;"/>
                </div>
            </div>
        </form>
    </article>
</section>
<jsp:include page="paging.jsp" flush="true">
  <jsp:param name="url" value="zootopia.do?command=qnaList" />
</jsp:include>
<%@ include file="/qna/css/qna_css.jsp" %>
<%@ include file="../footer.jsp" %>
