<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zootopia admin</title>

<!-- 구글 웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<link rel="stylesheet" href="admin/css/admin.css">


<!-- 슬라이드 api -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>


<script src="admin/script/admin.js"></script>

</head>
<body>

<header>
<div class="header-container">
	<div class="logo-menu">
		<div class="logo">
			<a href="#">Zootopia Admin</a>
		</div>
		<nav class="navigation">
			<ul>
				<li><a href="zootopia.do?command=adminmemberlist">회원 관리</a></li>
				<li><a href="zootopia.do?command=admincommunitylist">커뮤니티 관리</a></li>
				<li><a href="zootopia.do?command=admincontestlist&category=all&pagenum=1&search=">콘테스트 관리</a></li>
				<li><a href="zootopia.do?command=adminqnalist">Q&A 관리</a></li>
			</ul>
		</nav>
	
	</div>
	
	<div class="login-menu">
		<c:choose>
			<c:when test="${empty adminUser}">
				<a href="zootopia.do?command=adminlogin">Login</a>
			</c:when>
			<c:otherwise>
				<a>${adminUser.adminid}(${adminUser.name}) 관리자님</a>
				<a href="zootopia.do?command=adminlogout">Logout</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</header>

<div class="wrapper">
<div id="content">


