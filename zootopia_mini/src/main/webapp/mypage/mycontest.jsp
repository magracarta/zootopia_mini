<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<%@ include file="section/mypage_info.jsp" %>


	<form name="mypageMycontestForm">
		<div class="container">
			<div class="column">
			<h2>내 콘테스트(총 콘테스트 수${allcnt})</h2>
				<div class="contestlist">
					<h3>콘테스트 제목${contestList.subject}</h3>
					<p>콘테스트 내용${list.content}</p>
				</div>
				<div class="contestlist">
					<h3>콘테스트 제목${list.subject}</h3>
					<p>콘테스트 내용${list.content}</p>
				</div>
			</div>
			<div class="column">
			<h2>참가중인 콘테스트(총 콘테스트 수${allcnt})</h2>
				<div class="contestlist">
					<h3>콘테스트 제목${list.subject}</h3>
					<p>콘테스트 내용${list.content}</p>
				</div>
				<div class="contestlist">
					<h3>콘테스트 제목${list.subject}</h3>
					<p>콘테스트 내용${list.content}</p>
				</div>
			</div>
			<div class="column">
			<h2>종료된 콘테스트(총 콘테스트 수${allcnt})</h2>
				<div class="contestlist">
					<h3>콘테스트 제목${list.subject}</h3>
					<p>콘테스트 내용${list.content}</p>
				</div>
				<div class="contestlist">
					<h3>콘테스트 제목${list.subject}</h3>
					<p>콘테스트 내용${list.content}</p>
				</div>
			</div>
		</div>
	</form>
		
<%@ include file="css/mypage_css.jsp" %>
<%@ include file="css/mycontest.jsp" %>
<%@ include file ="../footer.jsp" %>

