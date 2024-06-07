<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>

<div class="contest contest_detail">
	<div class="title-wrapper">
		<h2 class="title">콘테스트 수정</h2>
	</div>
	<div class="contestform">
		<form name="contestform">
			<input type="hidden" name="command" value="adminContestupdate">
			<input type="hidden" name="cseq" value="${contest_detail.cseq}">
			<input type="hidden" name="category" value="${category}">
			<input type="hidden" name="beforePageNum" value="${beforePageNum}">
			
			<div class="title">
				<span>제목</span>
				<input type="text" name="subject"  value="${contest_detail.subject}">
				
			</div>
			<div class="content">
				<span>내용</span>
				<textarea name="content">${contest_detail.content}</textarea>
			</div>
			<div class="lastdate selectcontainer">
				<span>마감기한<br><small style="color:#999; font-size:12px;">*(현재 시간기준으로 변경되는 일자입니다.)</small></span>
				
				<input type="hidden" name="lastdate">
				<div class="button-wrap"><a href="javascript:" >마감기한 변경 <img src="images/arrow.svg"></a></div>
				<div class="select-container">
					<ul>
						<li data-value="none"><a href="javascript:">변경하지 않기</a></li>
						<li data-value="2"><a href="javascript:">2일</a></li>
						<li data-value="3"><a href="javascript:">3일</a></li>
						<li data-value="4"><a href="javascript:">4일</a></li>
						<li data-value="5"><a href="javascript:">5일</a></li>
					</ul>
				</div>
			</div>
			
			<div class="paricipant selectcontainer">
				<span>참가 수</span>
				<input type="hidden" name="length">
				<div class="button-wrap"><a href="javascript:">참가 수 변경 <img src="images/arrow.svg"></a></div>
				<div class="select-container">
					<ul>
						<li data-value="none"><a href="javascript:">변경하지 않기</a></li>
						<c:forEach begin ="${1+contest_detail.cpdList.size()}" end ="6" varStatus="status">
							<li data-value="${status.index}"><a href="javascript:">${status.index}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="button_wrap">
			<input type="submit" value="등록" onclick="return go_createcontest()">
			<input type="button" value="취소" onClick="history.back()">
			</div>
		</form>
	</div>

</div>
<script src="admin/contest/script/contestForm.js"></script>





<%@ include file="/admin/footer.jsp" %>
<%@ include file="/admin/contest/css/admincontest_css.jsp" %>