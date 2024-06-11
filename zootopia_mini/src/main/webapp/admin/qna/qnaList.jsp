<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                <c:if test="${not empty qnaList}">
                    <c:forEach items="${qnaList}" var="qnaVO">
                        <div class="row">
                            <div class="coltitle">${qnaVO.qseq}</div>
                            <div class="coltitle">
                                <a href="zootopia.do?command=adminqnadetail&qseq=${qnaVO.qseq}">${qnaVO.subject}</a>
                            </div>
                            <div class="coltitle">${qnaVO.userid}</div>
                            <div class="coltitle"><fmt:formatDate value="${qnaVO.createdate}" type="date"/></div>
                            <div class="coltitle">
                                <c:choose>
                                    <c:when test="${empty qnaVO.reply}">답변 전</c:when>
                                    <c:otherwise>답변 완료</c:otherwise>
                                </c:choose>
                            </div> 
                        </div>
                    </c:forEach>
                </c:if>
                <c:url var="action" value="zootopia.do?command=adminqnalist" />
                <div class="pagination">
                </div>
            </div>
        </form>
    </article>
</section>
<jsp:include page="/admin/paging/paging.jsp" flush="true">
  <jsp:param name="url" value="zootopia.do?command=adminqnalist" />
</jsp:include>
<%@ include file="/qna/css/qna_css.jsp" %>
<%@ include file="/admin/footer.jsp" %>