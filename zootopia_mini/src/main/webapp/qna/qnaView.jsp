<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>

	<%@ include file="sub_image_menu.jsp" %>
		<article>
			<form name="frm">
				<h2> Q & A View </h2>
				<div class="field" style="border-top:2px solid black;">
					<label>작성자</label><div>${qnaVO.userid}</div>
				</div>
				<div class="field" style="border-top:1px solid black;">
					<label>제목</label><div>${qnaVO.subject}</div>
				</div>
				<div class="field" style="border-top:1px solid black;">
					<label>등록일</label><div><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
				</div>
				<div class="field" style="border-top:1px solid black;">
					<label>질문내용</label><div><pre>${qnaVO.content}</pre></div>
				</div>
				<div class="field" style="border-bottom:1px solid black;border-top:1px solid black;">
					<label>답변내용</label><div style="padding:10px;">${qnaVO.reply}</div>
				</div>
				<div class="btn" >
		   			<input type="button" value="목록으로" onClick="location.href='zootopia.do?command=qnaList'">	
		   		</div>	
			</form>
		</article>

	</div>

</section>
 <%@ include file="../footer.jsp" %>