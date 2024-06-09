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

function go_search(command) {
	var url="zootopia.do?command=" + command + "&page=1";
	document.frm.action = url;
	document.frm.submit();
}

function show_preview(){
	
	document.getElementById('photoinput').addEventListener('change', function(event) {
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
}

function go_detail(userid){
	location.href="zootopia.do?command=adminmemberdetail&userid=" + userid;
}


function go_updateMember(){
	if( document.modifyForm.pwd.value == "") {
	    alert("비밀번호를 입력해 주세요.");	    
	    document.modifyForm.pwd.focus();
	     return false;
	} else if( document.modifyForm.pwd.value != document.modifyForm.pwd_check.value) {
	    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");	    
	    document.modifyForm.pwd_check.focus();
	     return false;
	} else if( document.modifyForm.name.value == "") {
	    alert("이름을 입력해 주세요.");	    
	    document.modifyForm.name.focus();
	     return false;
	} else if( document.modifyForm.phone.value == "") {
	    alert("전화번호를 입력해 주세요.");	   
	    document.modifyForm.phone.focus();
	     return false;
	}else if( document.modifyForm.email.value == "") {
	    alert("이메일을 입력해 주세요.");	   
	    document.modifyForm.email.focus();
	    return false;
	} else{
	    document.modifyForm.submit();
	    document.modifyForm.action = "zootopia.do?command=adminmemberupdate"
	}
}

function go_deleteMember(){
	document.modifyForm.submit();
	document.modifyForm.action = "zootopia.do?command=adminmemberdelete"
	
}

function increaseViewCountAndRedirect(gseq) {
	
	window.location.href = 'zootopia.do?command=communityDetail&gseq=' + gseq;
}

function validateForm() {
        var subject = document.forms["communityForm"]["subject"].value;
        var content = document.forms["communityForm"]["content"].value;
        if (subject == "") {
            alert("제목은 필수 입력사항입니다.");
            return false;
        }
        if (content == "") {
            alert("내용은 필수 입력사항입니다.");
            return false;
        }
    }
