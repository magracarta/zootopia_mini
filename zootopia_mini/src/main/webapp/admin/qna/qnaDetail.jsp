	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="/admin/header.jsp" %>
	<section>
	<div class="form-container">
			<article>
				<form name="frm">
					<h2 style="font-size: x-large;"> Q & A </h2>
					<div class="field" style="border-top:1px solid black;">
						<label>카테고리</label><div>${qnaVO.category}</div>
					</div>
					<div class="field" style="border-top:1px solid black;">
						<label>제목</label><div>${qnaVO.subject}</div>
					</div>
					<div class="field" style="border-top:1px solid black;">
						<label>작성자</label><div>${qnaVO.userid}</div>
					</div>
					
					<div class="field" style="border-top:1px solid black; ">
						<label>등록일</label><div><fmt:formatDate value="${qnaVO.createdate}" type="date"/></div>
					</div>
					 <div class="field" style="border-top:1px solid black; min-height: 100px;">
                    <label>질문내용</label>
                    <div class="content-box">${qnaVO.content}</div>
                	</div>
					<div class="field" style="border-bottom:1px solid black;border-top:1px solid black; min-height: 100px;">
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
			
           			<div class="btn">
                    <button type="button" onclick="location.href='zootopia.do?command=adminqnalist'">목록</button>
                    
	                <button type="button" onclick="location.href='zootopia.do?command=adminqnadelete&qseq=${qnaVO.qseq}'">삭제</button>
                    
                    
                    
                    
                </div>
            
        </form>
    </article>
    </div>
</section>
<%@ include file="/qna/css/qna_css.jsp" %>
<%@ include file="/admin/footer.jsp" %>

<script>
function deletePost(qseq) {
    if (confirm("정말 삭제하시겠습니까?")) {
        location.href = 'zootopia.do?command=deleteqna&qseq=' + qseq;
    }
}
</script>
