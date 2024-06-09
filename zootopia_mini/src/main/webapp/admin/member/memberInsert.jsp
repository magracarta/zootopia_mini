<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>

<script>
	document.getElementById('photoinput').addEventListener('change', function() {
    	var fileName = this.value.split('\\').pop(); 
    	document.getElementById('photoinput').textContent = fileName;
	});
</script>
<div class="container">
	<form method="post" action="zootopia.do?command=adminmemberinsertform" name="joinForm" enctype="multipart/form-data">
    	<h2>회원 추가</h2>
      	<div class="field_idcheck">
      		<input type="text" name="userid" size="12" placeholder="아이디"/>
			<input type="hidden" name="reid"/>
			<input type="button" value="중복확인" class="dup" onClick="idcheck()"/>
      	</div>
      	<div class="field">
         	<input name="pwd" type="password" placeholder="비밀번호"/>
      	</div>         
      	<div class="field">
			<input name="pwdCheck" type="password" placeholder="비밀번호 확인"/>   
      	</div>	
	  	<span style="float:right;">*&nbsp;${message}</span>
      	<div class="field">
			<input style="margin-top:50px;"name="name" type="text" placeholder="이름"/>   
      	</div>
      	<div class="field">
			<input name="email" type="text" placeholder="이메일"/>   
      	</div>
     	<div class="field_nicknamecheck">
			<input name="nickname" type="text" placeholder="닉네임" size="12"/>
			<input type="hidden" name="renickname"/>
			<input type="button" value="중복확인" class="dup" onClick="nicknamecheck()"/>   
      	</div>
      	<div class="field">
	  		<input name="phone" type="text" placeholder="전화번호"/>   
      	</div>
      	<div class="field_pet">
      		<div class="field_left">
      			<c:choose>
					<c:when test="${empty photoview.saveimage}">
						<img id="preview" src="images/E2E2E2.png" width="100px;" />
					</c:when>
					<c:otherwise>						
						<img id="preview" src="images/${photoview.saveimage}" width="100px;" />
					</c:otherwise>
				</c:choose>
      		<input type="file" id="photoinput" name="image" onClick="show_preview()"/>
      		<label for="photoinput"  style="margin-top:15px;"class="custom_photo_upload">이미지 등록</label>
      		<span id="fileName" class="file_name"></span>
      		</div>     
      		<div class="field_right">		
      			<div class="field">
      				<input type="text" name="petname" placeholder="반려견 이름"/>
      			</div>
      			<div class="field">
      				<select name="kind">
      					<option value="선택">선택</option>
      					<option value="강아지">강아지</option>
      					<option value="고양이">고양이</option>
      				</select>
      			</div>
      			<div class="field">
      				<select name="petgender">
      					<option value="선택">선택</option>
      					<option value="M">남아</option>
      					<option value="F">여아</option>
      				</select>
     			</div>
			</div>
		</div>
      	<div class="btn" style="margin-top:50px;">
         	<input type="button" style="background:black; color:white; border:1px solid black;" value="회원 추가" onClick="go_save()">
      	</div>
   	</form>
</div>


<%@ include file="/admin/footer.jsp" %>
