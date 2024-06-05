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