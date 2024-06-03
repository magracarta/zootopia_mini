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


$(document).ready(function() {
    $("#recommendButton").click(function() {
        var gseq = $("#gseq").val(); // 게시글 번호를 가져옴

        // 확인 창 띄우기
        if (confirm("정말로 추천하시겠습니까?")) {
            // 사용자가 확인을 눌렀을 경우에만 AJAX 요청 보내기
            $.ajax({
                url: "communityRecommands",
                type: "POST",
                data: { gseq: gseq },
                success: function(data) {
                    // 응답으로 받은 새로운 추천 수를 화면에 업데이트
                    $("#recommends").text(data);
                },
                error: function(xhr, status, error) {
                    console.error("AJAX request failed: " + error);
                }
            });
        }
    });
});

function cancel() {
        window.history.back();
    }