
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


function idcheck() {
	
	if(document.joinForm.userid.value==""){
		alert("아이디를 입력하고 중복체크를 진행하세요");
		document.joinForm.userid.focus();
		return;
	}
	var url = "zootopia.do?command=idcheckform&userid=" + document.joinForm.userid.value;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	
	window.open(url, "idcheck", opt);
	
}


function nicknamecheck() {
	
	if(document.joinForm.nickname.value==""){
		alert("닉네임을 입력하고 중복체크를 진행하세요");
		document.joinForm.nickname.focus();
		return;
	}
	var url = "zootopia.do?command=nicknamecheckform&nickname=" + document.joinForm.nickname.value;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	
	window.open(url, "idcheck", opt);
	
}


function idok(userid) {
	opener.joinForm.userid.value = userid;
	opener.joinForm.reid.value = userid;
	self.close();
}


function nicknameok(nickname) {
	opener.joinForm.nickname.value = nickname;
	opener.joinForm.renickname.value = nickname;
	self.close();
}


function go_save() {
	
	if(document.joinForm.userid.value==""){
		alert("아이디를 입력하여 주세요");
		document.joinForm.userid.focus();
	}else if(document.joinForm.reid.value != document.joinForm.userid.value){
		alert("아이디 중복확인을 하지 않았습니다");
		document.joinForm.reid.focus();	
	}else if(document.joinForm.pwd.value == document.joinForm.userid.value){
		alert("비밀번호를 입력해 주세요");
		document.joinForm.pwd.focus();	
	}else if(document.joinForm.pwd.value != document.joinForm.pwdCheck.value){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		document.joinForm.pwdCheck.focus();	
	}else if(document.joinForm.name.value == ""){
		alert("이름을 입력해 주세요");
		document.joinForm.name.focus();	
	}else if(document.joinForm.email.value == ""){
		alert("이메일을 입력해 주세요");
		document.joinForm.email.focus();	
	}else if(document.joinForm.nickname.value == ""){
		alert("닉네임을 입력해 주세요");
		document.joinForm.nickname.focus();
	}else if(document.joinForm.renickname.value != document.joinForm.nickname.value){
		alert("닉네임 중복확인을 하지 않았습니다");
		document.joinForm.renickname.focus();	
	}else if(document.joinForm.phone.value == ""){
		alert("전화번호를 입력해 주세요");
		document.joinForm.phone.focus();	
	}else if(document.joinForm.image.value == ""){
		alert("사진?를 입력해 주세요");
		document.joinForm.phone.focus();
	}else if(document.joinForm.petname.value == ""){
		alert("반려동물 이름을 입력해 주세요");
		document.joinForm.phone.focus();
	}else if(document.joinForm.kind.value == ""){
		alert("종류를 선택해 주세요");
		document.joinForm.phone.focus();
	}else if(document.joinForm.petgender.value == ""){
		alert("반려동물 성별을 선택해 주세요");
		document.joinForm.phone.focus();
	}else {
		document.joinForm.submit();
	}
	
	
	
	
}


