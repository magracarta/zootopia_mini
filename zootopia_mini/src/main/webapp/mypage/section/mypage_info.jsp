<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<form name="mypageForm">
			<div class="profile-container">
				<div class="profile-info">
					<div class="profile_img">
						<c:if test="${loginUser.saveimage == null}">
							<img   src="images/profileimage_null.jpg"  width="100px"/>
						</c:if>
						<c:if test="${loginUser.saveimage != null}">
							<img  src="images/${loginUser.saveimage}"  width="100px"/>
						</c:if>
					</div>
					<div class="profile-text">
						<p class="pet-nickname">${loginUser.petname}</p>
						<p class="user-info">${loginUser.nickname}(${loginUser.userid})</p>
						<p class="email">${loginUser.email}</p>
					</div>
				</div>
				<div class="profile-buttons">
		            <a href="zootopia.do?command=modifyform" class="btn btn-edit" >회원 정보 수정</a>
		            <a href="#" class="btn btn-delete" onclick="confirmDelete(event)">회원 탈퇴</a>
	        	</div>
			</div>
			<div class="mytext">
				<a href="zootopia.do?command=mycontest">콘테스트</a>
				<a href="#">내가 작성한 글</a>
				<a href="#">내가 쓴 댓글</a>
				<a href="#">내 Q&A</a>
			</div>
		</form>
		
		