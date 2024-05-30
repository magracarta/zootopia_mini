<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="container">
	<form method="post" action="zootopia.do?command=join" name="joinForm">
    	<h2>JOIN</h2>
      	<div class="field">
      		<input type="text" name="userid" size="12"/>
			<input type="hidden" name="reid"/>
			<input type="button" value="중복확인" class="dup" onClick="idcheck()"/>
      	</div>
      	<div class="field">
         	<input name="pwd" type="password" value="비밀번호"/>
      	</div>         
      	<div class="field">
			<input name="pwdCheck" type="password" value="비밀번호 확인"/>   
      	</div>
	  	<span style="font-size:80%; font-weight:bold; font-color:red;">${message}</span>
      	<div class="field">
			<input name="name" type="text" value="이름"/>   
      	</div>
      	<div class="field">
			<input name="email" type="text" value="이메일"/>   
      	</div>
     	<div class="field">
			<input name="nickname" type="text" value="닉네임" size="12"/>
			<input type="hidden" name="renickname"/>
			<input type="button" value="중복확인" class="dup" onClick="idcheck()"/>   
      	</div>
      	<div class="field">
	  		<input name="phone" type="text" value="전화번호"/>   
      	</div>
      	<div class="btn">
         	<input type="button" value="Join" onClick="go_save()">
      	</div>
   	</form>
</div>

<%@ include file="css/member.jsp" %>
<%@ include file="../footer.jsp" %>
