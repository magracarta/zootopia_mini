<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="container">
	<form method="post" action="zootopia.do?command=join" name="joinForm" enctype="multipart/form-data">
    	<h2>JOIN</h2>
      	<div class="field">
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
	  	<span style="font-size:80%; font-weight:bold; color:red;">*&nbsp;${message}</span>
      	<div class="field">
			<input name="name" type="text" placeholder="이름"/>   
      	</div>
      	<div class="field">
			<input name="email" type="text" placeholder="이메일"/>   
      	</div>
     	<div class="field">
			<input name="nickname" type="text" placeholder="닉네임" size="12"/>
			<input type="hidden" name="renickname"/>
			<input type="button" value="중복확인" class="dup" onClick="nicknamecheck()"/>   
      	</div>
      	<div class="field">
	  		<input name="phone" type="text" placeholder="전화번호"/>   
      	</div>
      	<div class="field">
      		<c:choose>
				<c:when test="${empty photoview.saveimage}">
					<img id="preview" src="images/noname.jpg" width="100px;" />
				</c:when>
				<c:otherwise>						
					<img id="preview" src="images/${photoview.saveimage}" width="100px;" />
				</c:otherwise>
			</c:choose>
      	<input type="file" id="photo" onClick="show_preview()"/>      		
      	</div>
      	<div class="field">
      		<input type="text" name="petname" placeholder="반려견 이름"/>
      	</div>
      	<div class="field">
      		<select name="kind">
      			<option value="강아지">강아지</option>
      			<option value="고양이">고양이</option>
      		</select>
      	</div>
      	<div class="field">
      		<select name="petgender">
      			<option value="M">남아</option>
      			<option value="F">여아</option>
      		</select>
      	</div>
      	<div class="btn">
         	<input type="button" value="Join" onClick="go_save()">
      	</div>
      	<span>이미 계정이 있으신가요?&nbsp;<a href="zootopia.do?command=loginform" style="font-weight:bold;">로그인</a></span>
   	</form>
</div>

<%@ include file="css/member.jsp" %>
<%@ include file="../footer.jsp" %>
