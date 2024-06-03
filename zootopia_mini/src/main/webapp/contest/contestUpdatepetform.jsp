<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String className =request.getParameter("className");
String command =request.getParameter("command");

%> 
<div class="<%=className%> petContainer">
	<div class="createForm_wrapper">
		<a href="jvascript:0" class="closeBtn"><img src="images/close.png"></a>
		<form name="contestUpdatePet" action="zootopia.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="<%=command%>">
			<input type="hidden" name="userid" value="${loginUser.userid}">
			<input type="hidden" name="cseq" value="${contest_detail.cseq}">
			<input type="hidden" name="cpseq">
			<input type="hidden" name="index" value="${index}">
			<h3>펫 수정</h3>
			<div class="cotainer">
				<div class="left">
					<img src="images/${pet_noimage.png}">
					<input type="file" name="imagefile">
					<div class="img-button-container">
						<a href="javascript:0" class="change_btn">이미지 변경</a>
						<a href="javascript:0" class="before_btn">이전 이미지로</a>
					</div>
				</div>
				<div class="right">
					<div class="petname">
						<span class="title">이름</span>
						<span class="content">${loginUser.petname}</span>
					</div>
					<div class="content-text">
						<span class="title">내용</span>
						<textarea name="content"></textarea>
					</div>
				</div>
			
			</div>
			<div class="submitbutton_container">
				<input class="submitbutton" type="submit" value="등록" onclick="return petUpdateform('${loginUser.userid}')">			
			</div>
		</form>
		
	</div>
	<div class="overay"></div>
</div>


<style>
	.img-button-container { display:flex; text-align: center; margin-top:10px; }
	.before_btn ,
	.change_btn { width:50%;
	font-size:15px; padding:10px 0;  display:block; border:1px solid #999; color:#fff; background: #999; border-radius: 0px;}
	.before_btn { margin-left:10px;color:#999; background: #fff; }

</style>