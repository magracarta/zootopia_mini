function loginCheck(){
	if( document.loginForm.userid.value == "" ){
		alert("아이디를 입력하세요");
		document.loginForm.userid.focus();
		return false;
	}else if(document.loginForm.pwd.value == ""){
		alert("패스워드를 입력하세요");
		document.loginForm.pwd.focus();
		return false;
	}else{
		return true;
	}
}
function deleteCommunity(gseq) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = 'zootopia.do?command=communityDelete&gseq=' + gseq;
    }
}

function updateCommunity() {
    if (confirm("정말로 수정하시겠습니까?")) {
        return true; // 확인이 눌렸을 때 폼이 제출됩니다.
    } else {
        return false; // 취소가 눌렸을 때 폼이 제출되지 않습니다.
    }
}


function recommands(recommands)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // 결과 출력
  resultElement.innerText = number;
}