<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String className =request.getParameter("className");
String command =request.getParameter("command");

%> 
<div class="<%=className%> petContainer">
	<div class="createForm_wrapper">
		<a href="jvascript:0" class="closeBtn"><img src="images/close.png"></a>
		<form name="contestAddPet" action="zootopia.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="<%=command%>">
			<input type="hidden" name="userid" value="${loginUser.userid}">
			<input type="hidden" name="cseq" value="${contest_detail.cseq}">
			<input type="hidden" name="index" value="${index}">
			<h3>펫 등록</h3>
			<div class="cotainer">
				<div class="left">
					<img src="images/pet_noimage.png">
					<input type="file" name="imagefile">
					<%if (className == "updateFormcontainer"){
					%>
						<a href="javascript:0" class="change_btn">이미지 변경</a>
						<a href="javascript:0" class="before_btn">이전 이미지로</a>
					<%		
					}%>
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
				<input class="submitbutton" type="submit" value="등록" onclick="return petform('${loginUser.userid}')">			
			</div>
		</form>
		
	</div>
	<div class="overay"></div>
</div>


<style>


/* 펫 폼 */
.petContainer {display:none;  position:fixed; top:0; left:0; width:100%; height:100%;  z-index:20;  align-items: center; justify-content: center; }
.overay { position:absolute; width:100%; height:100%; background:rgba(0,0,0,0.5);  top: 0; left: 0; z-index:1; }
.petContainer .createForm_wrapper { position:relative; z-index:2; max-width:1100px; margin:0 auto; background:#fff; width: 90%; }
.petContainer .createForm_wrapper .closeBtn { position:absolute; right:20px; top:20px; }
.petContainer .createForm_wrapper form { padding:30px 70px; }
.petContainer .createForm_wrapper form h3 { font-size:18px; margin-bottom:30px; color:#000; font-weight:600; }
.petContainer .createForm_wrapper form .cotainer { display:flex; align-items: flex-end; }
.petContainer .createForm_wrapper form .left { width:283px; }
.petContainer .createForm_wrapper form .left img { width:100%; height:283px; object-fit: cover;}
.petContainer .createForm_wrapper form .left input { display:none; }

.petContainer .createForm_wrapper form .right { width:70%;padding-left:30px; }
.petContainer .createForm_wrapper form .right > div { margin-top:30px; }
.petContainer .createForm_wrapper form .right > div .title { font-size:18px; color:#000; font-weight:700; }
.petContainer .createForm_wrapper form .right > div .content { font-size:18px; margin-left:15px; }
.petContainer .createForm_wrapper form .right > div textarea {margin-top:10px; height:151px; }
.petContainer .createForm_wrapper form .right .petname {  }
.petContainer .submitbutton_container { display:flex; justify-content: flex-end; margin-top:30px; }
.petContainer .submitbutton_container .submitbutton { background:#000; color:#fff; padding:12px 78px; border-radius:5px; border:none; }

</style>