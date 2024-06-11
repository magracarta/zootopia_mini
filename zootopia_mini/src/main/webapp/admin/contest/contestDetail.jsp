<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>


<div class="contest contest_detail">
	<div class="title-wrapper">
		<div  class="left">
			<%-- <span class="detail_num">NO. ${contest_detail.cseq}</span> --%>
			
			<c:if test="${index != null}"><span class="detail_num">NO. ${index}</span></c:if>
			<span class="detailinfo">작성자 : ${contest_detail.nickname} / 조회수 : ${contest_detail.cnt}</span>
			<h2 class="title">${contest_detail.subject}</h2>
			
			<pre>${contest_detail.content}</pre>
			
		</div>
		
		<div class="right" style="text-align: right;">
				
			<span class="lastdate" style="display:block; color:#FF4646; margin-bottom:10px; text-align:right;"><fmt:formatDate value="${contest_detail.lastdate}" pattern="yy/MM/dd hh:mm:ss" />까지 마감기한</span>

			<c:if test="${contest_detail.lastdate < now}"><span style="display:block; margin-bottom:20px;">완료된 콘테스트</span></c:if>
			<a style="margin:15px 0;" href="zootopia.do?command=adminContestUpdateForm&cseq=${contest_detail.cseq}&category=${category}&pagenum=${beforePageNum}">콘테스트 수정하기</a>
			<a style="margin-bottom:15px; margin-left:10px;" href="zootopia.do?command=admincontestlist&category=${category}&pagenum=${beforePageNum}">목록으로 ></a>
		</div>
	</div>
	<form name="petdeleteForm">
	<input type="hidden" name="command" value="adminContestPetandReplyremoveDeleteAll">
	<input type="hidden" name="pagenum" value="${pagenum}">
	<input type="hidden" name="cseq" value="${contest_detail.cseq}">
	<input type="hidden" name="category" value="${category}">
	<input type="hidden" name="beforePageNum" value="${beforePageNum}">
	<input type="hidden" name="pagenum" value="${paging.currentPage}">
	<div class="contest_pet_list">
		<div class="contestpetInfo_container">
			<div class="contestpetInfo">
				참가 현황 - (${contest_detail.cpdList.size()}/${contest_detail.pcnt})
			</div>
		</div>
		
		<c:if test="${contest_detail.cpdList.size() > 0 }">
		<div class="buttonbox">
			<div class="allcheckbox">
			<input type="checkbox" name="allcheck" id="allcheck">
			<label for="allcheck">참가자 모두 선택 (<span>0/0</span>)</label>
			</div>
			<div class="button-box">
			<input type="submit" class="displaynone" value="참가자 삭제">
			<input type="button" value="참가자 삭제">
			</div>
		</div>
		</c:if>
		<ul>
			<c:forEach items ="${contest_detail.cpdList}" var="plist" varStatus="state" >
				 <li>
				 		<input type="checkbox" name="cpseq" value="${plist.cpseq}" class="petlistcpseq">
				 	<div class="image-box">
				 		<img src="images/${plist.saveimage}">
					 	<div class="rank">
					 		${state.index+1}위
					 	</div>
					 	<div class="text-box">
					 		<div class="kind_recommend">
					 			<span class="tag">추천 : ${plist.recommends}</span>
					 			<span>${plist.kind}</span>
					 		</div>
					 		<div class="content_box">
					 			<span class="name">이름 : ${plist.petname}</span>
				 				<c:if test = '${plist.petgender == "F"}'>
				 					<span class="gender wemen">♀</span>
				 				</c:if>
					 			<c:if test = '${plist.petgender == "M"}'>
			 						<span class="gender men">♂</span>
				 				</c:if>
			 					<pre class="content">${plist.content}</pre>
					 		</div>
					 		
					 	</div>
				 	</div>
				</li>
			</c:forEach>
			
		</ul>
		
	</div>
</form>

	<div class="reply">
		<h2>댓글 ${replyAll}개</h2>
		<form name="replyDeleteForm">
		<input type="hidden" name="command" value="adminContestPetandReplyremoveDeleteAll">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="beforePageNum" value="${beforePageNum}">
		<input type="hidden" name="pagenum" value="${paging.currentPage}">
		<input type="hidden" name="cseq" value="${contest_detail.cseq}">
		<c:if test="${creplylist.size() > 0 }">
		<div class="buttonbox">
			<div class="allcheckbox">
			<input type="checkbox" name="allcheck" id="allcheck">
			<label for="allcheck">댓글 모두 선택 (<span>0/0</span>)</label>
			</div>
			<div class="button-box">
			<input type="submit" class="displaynone" value="댓글 삭제">
			<input type="button" value="댓글 삭제">
			</div>
		</div>
		</c:if>
		<div class="reply_list">
			<ul>
				<c:forEach items="${creplylist}" var ="replylist" varStatus="state">
					<li>
						<div class="top">
							<input type="checkbox" name="crseq" value="${replylist.crseq}">
							<div class="image_box">
								<c:if test ="${replylist.mvo.saveimage != null}">
									<img src="images/${replylist.mvo.saveimage}">
								</c:if>
								<c:if test ="${replylist.mvo.saveimage == null}">
									<img src="images/repl-noimg.png">
								</c:if>
								
							</div>
							<div class="text-box">
								<span>@ ${replylist.mvo.nickname }</span>
								<pre>${replylist.content }</pre>
							</div>
							<div class="button-box">
								<p>${replylist.createdate}</p>
							</div>
							</div>
					</li>		
				</c:forEach>
				
				
			</ul>
			<jsp:include page="/paging/paging.jsp" flush="true" >
				<jsp:param name="url" value="zootopia.do?command=contestDetail&cseq=${contest_detail.cseq}&index=${index}" />
				<jsp:param name="search" value="${search}" />
			</jsp:include>
		</div>
		</form>
	</div>


</div>
<style>
.serach-form { display:none; }
</style>







<script src="admin/contest/script/contestDetail.js"></script>

<%@ include file="/admin/footer.jsp" %>
<%@ include file="/admin/contest/css/admincontest_css.jsp" %>