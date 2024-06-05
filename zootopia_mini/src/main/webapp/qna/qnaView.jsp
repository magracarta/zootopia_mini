	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="../header.jsp" %>
	<link rel="stylesheet" href="qna/css/qnacss.css">
	<section>
	<div class="form-container">
			<article>
				<form name="frm">
					<h2 style="font-size: x-large;"> Q & A </h2>
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
						<label>질문내용</label><div><pre>${qnaVO.content}</pre></div>
					</div>
					<div class="field" style="border-bottom:1px solid black;border-top:1px solid black; min-height: 100px;">
						<label>답변내용</label><div style="padding:10px;">${qnaVO.reply}</div>
					</div>
			
           			<div class="btn">
                    <button type="button" onclick="location.href='zootopia.do?command=qnaList'">목록으로</button>
                    
                    <c:if test="${loginUser.userid == qnaVO.userid}">
	                    <button type="button" onclick="deletePost(${qnaVO.qseq})">삭제</button>
                    </c:if>
                    
                    <button type="button" onclick="location.href='zootopia.do?command=myqna'">Q&A 목록</button>
                    
                </div>
            
        </form>
    </article>
    </div>
</section>

<%@ include file="../footer.jsp" %>

<script>
function deletePost(qseq) {
    if (confirm("정말 삭제하시겠습니까?")) {
        location.href = 'zootopia.do?command=deleteqna&qseq=' + qseq;
    }
}
</script>
