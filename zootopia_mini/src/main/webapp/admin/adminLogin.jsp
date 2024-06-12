<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="admin/css/admin.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<script src="admin/script/admin.js"></script>
</head>
<body
	style="display: flex; justify-content: center; align-items: center;">
	<div class="container-member">
		<form method="post" action="zootopia.do?command=adminlogin"
			name="adminloginForm">
			<h2>Zootopia Admin</h2>
			<div class="field">
				<input name="adminid" type="text" placeholder="아이디" />
			</div>
			<div class="field">
				<input name="pwd" type="password" placeholder="비밀번호" />
			</div>
			<span style="float: right; color:red;">*&nbsp;${message1}</span>
			<div class="btn">
				<input type="submit" value="Login"
					onClick="return adminloginCheck()">
			</div>
			<span style="color: #333; float: right;">사용자 페이지로
				돌아가기&nbsp;&nbsp;<a href="zootopia.do?command=main"
				style="font-weight: bold;">user</a>
			</span>
		</form>
	</div>
</body>
</html>