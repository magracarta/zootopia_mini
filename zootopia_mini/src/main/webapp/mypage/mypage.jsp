<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>

<style>
.profile-container{
	border: 1px dotted red;
	background-color: rgba(0, 0, 0, 0.04);
	width: 200px;
	
}
.profile-info{
	
}
.profile-img{}
.profile-img .p{}
.profile-buttons{}
</style>

	<div class="profile-container">
		<div class="profile-info">
			<img src="images/조하.jpg" class="profile_img" width="50px"/>
			<p>펫 닉네임</p>
			<p>닉네임(아이디)</p>
			<p>email@naver.com</p>
		</div>
		<div class="profile-buttons">
			<a href="#" var="회원정보수정"></a>
			<a href="#" var="회원탈퇴"></a>
		</div>
    
    <div class="">
	    <span>컨테스트</span>
	    
	    
	    
	    <span>내가 작성한 글</span>
	    
	    
	    
	    <span>내가 쓴 댓글</span>
	    
	    
	    
	    
	    <span>내 Q&A</span>
    
    </div>
    
<%@ include file ="../footer.jsp" %>