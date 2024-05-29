<%@  page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="container">
   <form method="post" action="zootopia.do?command=login" name="loginForm">
      <h2>LOGIN</h2>
      <div class="field">
         <input name="userid" type="text" value="아이디" />
      </div>
      <div class="field">
         <input name="pwd" type="password" value="비밀번호"/>
      </div>         
	  <span style="font-size:80%; font-weight:bold; font-color:red;">${message}</span>
      <div class="btn">
         <input type="submit" value="Login" onClick="return loginCheck()" >
         <input type="button" value="Join" onClick="zootopia.do?command=joinform">
      </div>
   </form>
</div>

<%@ include file="css/member.jsp" %>
<%@ include file="../footer.jsp" %>
