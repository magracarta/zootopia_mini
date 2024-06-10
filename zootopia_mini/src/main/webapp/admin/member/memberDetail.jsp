<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>


<div class="container-detail">
	<h1 class="title-detail">회원 정보 수정</h1>
    	<form method="post" class="update-form"  action="zootopia.do?command=adminmemberupdate" name="modifyForm" enctype="multipart/form-data">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="userid" class="form-control" value="${memberVO.userid}" name="userid" readonly>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" style="border:2px solid #ddd;" id="pwd" class="form-control" value="${memberVO.pwd}" name="pwd">
            </div>
            <div class="form-group">
                <label for="confirm-pwd">비밀번호 확인</label>
                <input type="password" style="border:2px solid #ddd;">
                	 <p id="error-text" class="error-text" style="display: none;">비밀번호가 일치하지 않습니다.</p>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" class="form-control" value="${memberVO.name}" name="name">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" class="form-control" value="${memberVO.email}" name="email">
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" class="form-control" value="${memberVO.nickname}" name="nickname">
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="tel" id="phone" class="form-control" value="${memberVO.phone}" name="phone">
            </div>
            <div class="form-group">
                <label for="pet-name">반려견 이름</label>
                <input type="text" id="pet-name" class="form-control" value="${memberVO.petname}" name="petname">
            </div>
            <div class="form-group">
                <label for="pet-type">종류</label>
                <select id="pet-type" class="form-control" name="kind">
                	<c:choose>
                		<c:when test="${memberVO.kind eq '고양이'}" >
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
                		<c:when test="${memberVO.petgender eq 'M'}" >
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
            <div class="form-group" style="display:flex; flex-direction:column;">
        		<label for="pet-photo">사진</label>
        			<c:choose>
						<c:when test="${empty photoview.saveimage}">
							<img style="width:300px; height:200px;" id="preview" src="images/E2E2E2.png" width="100px;" />
						</c:when>
						<c:otherwise>						
							<img style="width:300px; height:200px;" id="preview" src="images/${photoview.saveimage}" width="100px;" />
						</c:otherwise>
					</c:choose>
	       		<input type="file" id="photoinput" name="image" onClick="show_preview()"/>
	       		<label for="photoinput"  style="margin-top:15px;"class="custom_photo_upload">이미지 등록</label>
      			<span id="fileName" class="file_name"></span>
	    	</div>
	        <div class="btn" style="display:flex; justify-content:center; align-items:center;">
	           	<input type="submit" style="background:white; color:black; margin-top:50px; width:100px" value="수정" onclick="return go_updateMember()">
	        </div>
	        <div class="btn" style="display:flex; justify-content:center; align-items:center;">
	            <input type="button" style="float:left; width:100px;"value="삭제" onclick="location.href='zootopia.do?command=adminmemberdelete&userid=${memberVO.userid}'">
	        </div>
	        
        </form>
    </div>
    
<script>



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

<%@ include file="/admin/footer.jsp"%>