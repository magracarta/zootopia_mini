<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>
<%@ include file="/qna/css/qna_css.jsp" %>
	
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
				<div class="field" style="min-height: 100px;">
						<label>답변내용</label>
						<div style="padding:10px; align-items:center;">
			
							<c:choose>
								<c:when test='${empty qnaVO.reply}'> <!-- 관리자 답변 전 표시 -->
									
									<form id="replyForm" method="post" action="zootopia.do">
										<input type="hidden" name="command" value="adminqnareplyupdate">
                                    	<input type="hidden" name="qseq" value="${qnaVO.qseq}">
                                    	<textarea name="reply" rows="3" style="flex:3"></textarea>
                                    	<input type="submit" class="btn" value="저장">
                                    </form>
								</c:when>
								<c:otherwise>
									${qnaVO.reply}
								</c:otherwise>
							</c:choose>
						</div>
					</div>
			
           		<div class="btn" style="display:flex; flex-direction:row;">
                    <button type="button" onclick="location.href='zootopia.do?command=adminqnalist'">Q&A 목록</button>
                    
	                <button type="button" onclick="location.href='zootopia.do?command=adminqnadelete&qseq=${qnaVO.qseq}'">삭제</button>
             
                </div>
            
        	</form>
    	</article>
    </div>
</section>

<%@ include file="/admin/footer.jsp" %>

<script>
function deletePost(qseq) {
    if (confirm("정말 삭제하시겠습니까?")) {
        location.href = 'zootopia.do?command=deleteqna&qseq=' + qseq;
    }
}
</script>
