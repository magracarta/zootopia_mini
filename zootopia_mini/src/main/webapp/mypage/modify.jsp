<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="script/mypage.js"></script>

<div class="container">
        <h1 class="title">회원 정보 수정</h1>
        <form method="post" class="update-form"  action="zootopia.do?command=modify" name="modifyForm" enctype="multipart/form-data">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="userid" class="form-control" value="${loginUser.userid}" name="userid">
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="pwd" class="form-control" value="${loginUser.pwd}" name="pwd">
            </div>
            <div class="form-group">
                <label for="confirm-pwd">비밀번호 확인</label>
                <input type="password" id="confirm-pwd" class="form-control" name="pwd_check">
                	 <p id="error-text" class="error-text" style="display: none;">비밀번호가 일치하지 않습니다.</p>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" class="form-control" value="${loginUser.name}" name="name">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" class="form-control" value="${loginUser.email}" name="email">
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" class="form-control" value="${loginUser.nickname}" name="nickname">
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="tel" id="phone" class="form-control" value="${loginUser.phone}" name="phone">
            </div>
            <div class="form-group">
                <label for="pet-name">반려견 이름</label>
                <input type="text" id="pet-name" class="form-control" value="${loginUser.petname}" name="petname">
            </div>
            <div class="form-group">
                <label for="pet-type">종류</label>
                <select id="pet-type" class="form-control" name="kind">
                	<c:choose>
                		<c:when test="${loginUser.kind eq '고양이'}" >
	                		<option value="강아지" >강아지</option>
		                    <option value="고양이" selected>고양이</option>
                		</c:when>
                		<c:otherwise>
                			<option value="강아지" selected>강아지</option>
		                    <option value="고양이">고양이</option>
                		</c:otherwise>
                	</c:choose>
                </select>
            </div>
            <div class="form-group">
                <label for="pet-gender">성별</label>
                <select id="pet-gender" class="form-control" name="petgender">
                	<c:choose>
                		<c:when test="${loginUser.petgender eq 'M'}" >
	                		<option value="M" >남아</option>
		                    <option value="F" selected>여아</option>
                		</c:when>
                		<c:otherwise>
                			<option value="M" selected>남아</option>
		                    <option value="F">여아</option>
                		</c:otherwise>
                	</c:choose>
                </select>
            </div>
            <div class="form-group">
        <label for="pet-photo">사진</label>
        	<c:if test="${loginUser.saveimage == null}">
           	 	<img id="preview" src="images/repl-noimg.png" width="100px"/>
        	</c:if>
	        <c:if test="${loginUser.saveimage != null}">
	            <img id="preview" src="images/${loginUser.saveimage}" width="100px"/>
		    </c:if>
	        <input type="file" name="imagefile" id="pet-photo" class="form-control" >
	    </div>
            <div class="btn">
            	<input type="submit" value="회원정보수정" onclick="return go_updateMember()">
            </div>
        </form>
        <!-- <p class="login-link">이미 계정이 있으신가요? <a href="zootopia.do?command=login">로그인</a></p> -->
    </div>



<script>

document.getElementById('pet-photo').addEventListener('change', function(event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onload = function(e) {
        const preview = document.getElementById('preview');
        preview.src = e.target.result;
    }
    if (file) {
        reader.readAsDataURL(file);
    }
});
        
document.addEventListener('DOMContentLoaded', () => {
    const pwd = document.getElementById('pwd');
    const confirmPwd = document.getElementById('confirm-pwd');
    const errorText = document.getElementById('error-text');

    const checkPasswordMatch = () => {
        if (pwd.value === confirmPwd.value) {
            errorText.style.display = 'none';
        } else {
            errorText.style.display = 'block';
        }
    };

    pwd.addEventListener('input', checkPasswordMatch);
    confirmPwd.addEventListener('input', checkPasswordMatch);
});



</script>

<%@ include file="css/modify.jsp" %>
<%@ include file="../footer.jsp" %>