
function loginCheck() {
	if(document.loginForm.userid.value==""){
		alert("아이디를 입력하세요");
		document.loginForm.userid.focus();
		return false;
	}else if(document.loginForm.pwd.value==""){
		alert("패스워드를 입력하세요");
		document.loginForm.pwd.focus();
		return false;
	}else{
		return true;
	}
}

function idcheck(){
	
	if( document.joinForm.userid.value==""){
		alert("아이디를 입력하고 중복체크를 진행하세요" );
		documnet.joinForm.userid.focus();
		return;
	}
	var url = "zootopia.do?command=idcheckForm&userid=" + document.joinForm.userid.value;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	
	window.open(url, "idcheck", opt);
}