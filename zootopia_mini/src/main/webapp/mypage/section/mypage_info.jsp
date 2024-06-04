<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<form name="mypageForm">
			<div class="profile-container">
				<div class="profile-info">
					<div class="profile_img">
						<c:choose>
							<c:when test="${loginUser.saveimage == null}">
								<img   src="images/repl-noimg.png"  width="100px"/>
							</c:when>
							<c:otherwise>
								<img  src="images/${loginUser.saveimage}"  width="100px"/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="profile-text">
						<p class="pet-nickname">${loginUser.petname}</p>
						<p class="user-info">${loginUser.nickname}(${loginUser.userid})</p>
						<p class="email">${loginUser.email}</p>
					</div>
				</div>
				<div class="profile-buttons">
		            <a href="zootopia.do?command=modifyform" class="btn btn-edit" >회원 정보 수정</a>
		            <a href="zootopia.do?command=deletemember" class="btn btn-delete" >회원 탈퇴</a>
	        		<!-- onclick="confirmDelete(event)" -->
	        	</div>
			</div>
		</form>
		
		
		<%@ include file="mycategory.jsp" %>