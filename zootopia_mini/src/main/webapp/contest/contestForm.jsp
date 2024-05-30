<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/header.jsp" %>
<%@ include file ="css/content_css.jsp" %>
<div class="contest contest_detail">
	<div class="title-wrapper">
		<h2 class="title">콘테스트 등록</h2>
	</div>
	<div class="contestform">
		<form name="contestform">
			<input type="hidden" name="command" value="contestAction">
			<div class="title">
				<span>제목</span>
				<input type="text" name="subject">
				
			</div>
			<div class="content">
				<span>내용</span>
				<textarea name="content"></textarea>
			</div>
			<div class="lastdate">
				<span>마감기한</span>
				<input type="hidden" name="lastdate">
				<div class="button-wrap"><a href="javascript:">기한 설정 <img src="images/arrow.svg"></a></div>
				<div class="select-container">
					<ul>
						<li data-value="3"><a href="javascript:">3일</a></li>
						<li data-value="4"><a href="javascript:">4일</a></li>
						<li data-value="5"><a href="javascript:">5일</a></li>
						<li data-value="6"><a href="javascript:">6일</a></li>
						<li data-value="7"><a href="javascript:">7일</a></li>
					</ul>
				</div>
			</div>
			
			<div class="paricipant">
				<span>참가 수</span>
				<input type="hidden" name="lastdate">
				<div class="button-wrap"><a href="javascript:">참가 수 설정 <img src="images/arrow.svg"></a></div>
				<div class="select-container">
					<ul>
						<li data-value="3"><a href="javascript:">3마리</a></li>
						<li data-value="4"><a href="javascript:">4마리</a></li>
						<li data-value="5"><a href="javascript:">5마리</a></li>
						<li data-value="6"><a href="javascript:">6마리</a></li>
					</ul>
				</div>
			</div>
			
			
		</form>
	</div>
</div>
<%@ include file ="/footer.jsp" %>