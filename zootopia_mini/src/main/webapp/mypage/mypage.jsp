<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>

<link rel="stylesheet" href="mypage/css/mypage.css">
<div>
	<form method="post" action="zootopia.do?command=mypage" name="mypageForm">
		<div class="profile-container">
			<div class="profile-info">
				<img src="mypage/images/joha1.jpg" alt="프로필 이미지" class="profile_img" width="100px"/>
				<div class="profile-text">
					<p class="pet-nickname">펫 닉네임</p>
					<p class="user-info">닉네임(아이디)</p>
					<p class="email">email@naver.com</p>
				</div>
			</div>
			 <div class="profile-buttons">
	            <a href="mypage/modify.jsp" class="btn btn-edit">회원 정보 수정</a>
	            <a href="#" class="btn btn-delete">회원 탈퇴</a>
	        </div>
		</div>
	</form>
</div>
<%@ include file ="../footer.jsp" %>