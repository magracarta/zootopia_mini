<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>



		<form name="mypageForm">
			<div class="profile-container">
				<div class="profile-info">
					<div class="profile_img">
						<img src="mypage/images/${loginUser.image}.jpg"  width="100px"/>
					</div>
					<div class="profile-text">
						<p class="pet-nickname">${loginUser.petname}</p>
						<p class="user-info">${loginUser.nickname}(${loginUser.userid})</p>
						<p class="email">${loginUser.email}</p>
					</div>
				</div>
				<div class="profile-buttons">
		            <a href="zootopia.do?command=modify" class="btn btn-edit" >회원 정보 수정</a>
		            <a href="#" class="btn btn-delete">회원 탈퇴</a>
	        	</div>
			</div>
			<div class="mytext">
				<a href="zootopia.do?command=mycontest">콘테스트</a>
				<a href="#">내가 작성한 글</a>
				<a href="#">내가 쓴 댓글</a>
				<a href="#">내 Q&A</a>
			</div>
		</form>
	
	


<%@ include file="css/mypage.jsp" %>
<%@ include file ="../footer.jsp" %>