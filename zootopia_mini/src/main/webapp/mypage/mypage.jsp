<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>


<section>
	<article>
		<form name="mypageForm">
			<div class="profile-container">
				<div class="profile-info">
					<div class="profile_img">
						<img src="mypage/images/joha1.jpg" alt="프로필 이미지" width="100px"/>
					</div>
					<div class="profile-text">
						<p class="pet-nickname">펫 닉네임</p>
						<p class="user-info">닉네임(아이디)</p>
						<p class="email">email@naver.com</p>
					</div>
				</div>
				<div class="profile-buttons">
		            <a href="zootopia.do?command=mypage/modify" class="btn btn-edit" >회원 정보 수정</a>
		            <a href="#" class="btn btn-delete">회원 탈퇴</a>
	        	</div>
			</div>
			<div class="mytext">
				<a href="#">컨테스트</a>
				<a href="#">내가 작성한 글</a>
				<a href="#">내가 쓴 댓글</a>
				<a href="#">내 Q&A</a>
			</div>
			
		
		
		</form>
	
	
	</article>

</section>
	


<%@ include file="css/mypage.jsp" %>
<%@ include file ="../footer.jsp" %>