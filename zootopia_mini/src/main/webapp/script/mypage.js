



function confirmDelete(event) {
            event.preventDefault();
            if (confirm("정말 탈퇴하시겠습니까?")) {
                alert("회원 탈퇴가 완료되었습니다");
                window.location.href = "zootopia.do?command=index.jsp"; // 메인 페이지로 이동
            }
        }
        
function go_updateMember(){
	if( document.modifyForm.pwd.value == "") {
	    alert("비밀번호를 입력해 주세요.");	    
	    document.modifyForm.pwd.focus();
	} else if( document.modifyForm.pwd.value != document.modifyForm.pwd_check.value) {
	    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");	    
	    document.modifyForm.pwd_check.focus();
	} else if( document.modifyForm.name.value == "") {
	    alert("이름을 입력해 주세요.");	    
	    document.modifyForm.name.focus();
	} else if( document.modifyForm.phone.value == "") {
	    alert("전화번호를 입력해 주세요.");	   
	    document.modifyForm.phone.focus();
	}else if( document.modifyForm.email.value == "") {
	    alert("이메일을 입력해 주세요.");	   
	    document.modifyForm.email.focus();
	} else{
	    document.modifyForm.submit();
	}
}







