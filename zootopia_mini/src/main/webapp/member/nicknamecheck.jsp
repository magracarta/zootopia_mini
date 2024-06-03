<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="css/member.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idcheck.jsp</title>
<script type="text/javascript" src="script/member.js"></script>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="nickname_check_form">
	<h2>닉네임 중복확인</h2>
	<form method="post" name="nicknameCheckForm" action="zootopia.do?command=nicknamecheckform">
		닉네임 : <input type="text" style=""name="nickname" value="${nickname}" >
   		<input type="submit" value="검색"> <br><br><br>
	</form>
	<div>
		<c:if test="${result2==1}">
			<script type="text/javascript">
				opener.document.joinForm.nickname.value="";
				opener.document.joinForm.renickname.value="";
			</script>
			${nickname}&nbsp;는 이미 사용중인 아이디입니다!
		</c:if>
		<c:if test="${result2==-1}">
			${nickname}&nbsp;는 사용 가능한 닉네임입니다!
			<input type="button" value="사용할게요" onClick="nicknameok('${nickname}');">
		</c:if>
	</div>
</div>
</body>
</html>