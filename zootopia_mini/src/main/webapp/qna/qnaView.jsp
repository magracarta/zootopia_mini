	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="../header.jsp" %>
	<section>
	<div class="form-container">
			<article>
				<form name="frm" >
					<h2> Q & A </h2>
					<div class="field" >
						<label>제목</label><div>${qnaVO.subject}</div>
					</div>
					<div class="field" >
					<label>카테고리</label>
					<c:choose >
	                    <c:when test="${qnaVO.category == 1}">[콘테스트 문의]</c:when>
	                    <c:when test="${qnaVO.category == 2}">[자유게시판 문의]</c:when>
	                    <c:when test="${qnaVO.category == 3}">[기타 문의]</c:when>
	                    <c:otherwise></c:otherwise>
	                </c:choose>
					</div>
					<div class="field" >
						<label>작성자</label><div>${qnaVO.userid}</div>
					</div>
					
					<div class="field" >
						<label>등록일</label><div><fmt:formatDate value="${qnaVO.createdate}" type="date"/></div>
					</div>
					 <div class="field" >
                    <label>질문내용</label>
                    <div class="content-box">${qnaVO.content}</div>
                	</div>
					<div class="field">
						<label>답변내용</label>
						<div class="content-box">${qnaVO.reply}</div>
					</div>
			
           			<div class="btn">
                    <button type="button" onclick="location.href='zootopia.do?command=qnaList'">Q&A 목록</button>
                    
                    <c:if test="${loginUser.userid == qnaVO.userid}">
	                    <button type="button" onclick="deletePost(${qnaVO.qseq})">삭제</button>
                    </c:if>
                    
                    <button type="button" onclick="location.href='zootopia.do?command=myqna'">내 Q&A 목록</button>
                    
                </div>
            
        </form>
    </article>
    </div>
</section>
<%@ include file="/qna/css/qna_css.jsp" %>
<%@ include file="../footer.jsp" %>

<script>
function deletePost(qseq) {
    if (confirm("정말 삭제하시겠습니까?")) {
        location.href = 'zootopia.do?command=deleteqna&qseq=' + qseq;
    }
}
</script>
