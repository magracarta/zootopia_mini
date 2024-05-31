<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="qna/css/qnacss.css">
<section>
		<article>
			<form>
				<ul style="font-size: xx-large;
    font-weight: bold;"> Q & A List </ul>
				<div class="tb" >
					<div class="row">
						<div class="coltitle" style="width:19px; height:22px; top:373px; left:320px;">번호</div>
						<div class="coltitle" style="width:28px; height:22px; top:373px; left:417px;">제목</div>
						<div class="coltitle" style="width:42px; height:22px; top:373px; left:1131px;">닉네임</div>
						<div class="coltitle" style="width:42px; height:22px; top:373px; left:1347px;">작성일</div>
						<div class="coltitle" style="width:42px; height:22px; top:373px; left:1574px;">답변여부</div>
					</div>		
					<c:forEach items="${qnaList}"  var="qnaVO">
						<div class="row">
							<div class="col">${qnaVO.qseq}</div>
							<div class="col">
								<a href="zootopia.do?command=qnaView&qseq=${qnaVO.qseq}">${qnaVO.subject}</a>
							</div>
							<div class="col"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
							<div class="col">
								<c:choose>
									<c:when test="${empty qnaVO.reply}" >NO</c:when>
									<c:otherwise>YES</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
					<c:url var="action" value="zootopia.do?command=qnaList" />
					<div class="row">
						<div class="coltitle" style="font-size:80%; font-weight:bold;">
								
										<c:if test="${paging.prev}">
											<a href="${action}&page=${paging.beginPage-1}">◀</a>&nbsp;
										</c:if>
										<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
												<c:if test="${index==paging.page}">
													<span style="color:gray">${index}&nbsp;</span>
												</c:if>
												<c:if test="${index!=paging.page}">
													<a href="${action}&page=${index}">${index}&nbsp;</a>
												</c:if>
										</c:forEach>
										<c:if test="${paging.next}">
											&nbsp;<a href="${action}&page=${paging.endPage+1}">▶</a>&nbsp;
										</c:if>
						</div>
					</div>
					<div class="low">
							<div class="coltitle">
								<div class="btn">
									<input type="button" value="질문하기" 
									onClick="location.href='zootopia.do?command=writeQnaForm'"/>
							</div>
						</div>
					</div>
				</div>
			</form>
		</article>
	</div>
</section>
 <%@ include file="../footer.jsp" %>