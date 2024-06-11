<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section>
    <article>
        <form method="post" name="frm">
            <ul class="qna-header" style="text-align:left;">Q & A </ul>
            <div class="tb">
            	<div class="col-search">
					<img style="width:40px; height:39px; border-bottom:1px solid #C9C9C9; 
					padding:0; margin:0;" 
					src="admin/images/search.png"
					onClick="go_search('adminqnalist')"/>
					<input type="text" name="key" value="${key}" placeholder="qna 제목"/>
				</div>
                <div class="row" style="background:white; border-bottom:1px solid #676767; font-weight:bold;">
                    <div class="coltitle" style="flex:1;">번호</div>
                    <div class="coltitle" style="flex:1;">분류</div>
                    <div class="coltitle" style="flex:3; text-align:left;">제목</div>
                    <div class="coltitle" style="flex:1;">작성자</div>
                    <div class="coltitle" style="flex:1;">작성일</div>
                    <div class="coltitle" style="flex:1;">답변여부</div>
                </div>
                <c:if test="${not empty qnaList}">
                    <c:forEach items="${qnaList}" var="qnaVO">
                        <div class="row" style="font-weight:normal; background:white;">
                            <div class="coltitle" style="flex:1;">${qnaVO.qseq}</div>
                            <div class="coltitle" style="flex:1;">
		                    	<c:choose >
			                    	<c:when test="${qnaVO.category == 1}">[콘테스트 문의]</c:when>
			                    	<c:when test="${qnaVO.category == 2}">[자유게시판 문의]</c:when>
			                    	<c:when test="${qnaVO.category == 3}">[기타 문의]</c:when>
			                    	<c:otherwise></c:otherwise>
			                	</c:choose>
			                </div>
                            <div class="coltitle" style="flex:3; text-align:left;">
                                <a href="zootopia.do?command=adminqnadetail&qseq=${qnaVO.qseq}">${qnaVO.subject}</a>
                            </div>
                            <div class="coltitle" style="flex:1;">${qnaVO.userid}</div>
                            <div class="coltitle" style="flex:1;"><fmt:formatDate value="${qnaVO.createdate}" type="date"/></div>
                            <div class="coltitle" style="flex:1;">
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

<style>
	.tb .row{padding-left:0px;}
	.col-search{ display:flex; flex-direction:row; justify-content:flex-end; margin-bottom:80px; }
	.col-search img:hover{cursor:pointer;}
	.col-search input[type='text'] { width:200px; height:39.9px; border-top:0; border-left:0; border-right:0; border-bottom:1px solid #C9C9C9;}
</style>

<%@ include file="/qna/css/qna_css.jsp" %>
<%@ include file="/admin/footer.jsp" %>
