function adminloginCheck() {
	if(document.adminloginForm.adminid.value==""){
		alert("아이디를 입력하세요");
		document.adminloginForm.adminid.focus();
		return false;
	}else if(document.adminloginForm.pwd.value==""){
		alert("패스워드를 입력하세요");
		document.adminloginForm.pwd.focus();
		return false;
	}else{
		return true;
	}
}