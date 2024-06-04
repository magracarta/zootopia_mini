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
    $(".recommendButton").click(function() {
        var gseq = $(this).closest('li').find(".gseq").val(); // 게시글 번호를 가져옴

        // 확인 창 띄우기
        if (confirm("정말로 추천하시겠습니까?")) {
            // 사용자가 확인을 눌렀을 경우에만 AJAX 요청 보내기
            $.ajax({
                url: "http://localhost:8090/zootopia_mini/zootopia.do?command=communityRecommands",
                type: "POST",
                data: { gseq: gseq },
                success: function(data) {
                    // 서버로부터 받은 JSON 데이터를 파싱하여 추천 수를 화면에 업데이트
                    var recommends = data.recommends;
                    $(".recommands").text("추천 수[" + recommends + "]");
                },
                error: function(xhr, status, error) {
                    console.error("AJAX request failed: " + error);
                }
            });
        }
    });
});

function cancel() {
    var confirmed = confirm("작성을 취소하시겠습니까?"); // 사용자에게 확인 메시지 표시
    if (confirmed) {
        var href = "http://localhost:8090/zootopia_mini/zootopia.do?command=communityBoard"; // 이동할 페이지의 URL
        window.location.href = href;
    } else {
       
    }
}

function increaseViewCount(gseq) {
    $.ajax({
        type: "POST",
        url: "zootopia.do?command=communityViewCount&gseq=" + gseq,
        success: function(response) {
            console.log("View count increased successfully for post with gseq: " + gseq);
        },
        error: function(xhr, status, error) {
            console.error("Error occurred while increasing view count for post with gseq: " + gseq);
        }
    });
}

function increaseViewCountAndRedirect(gseq) {
    // 조회수 증가 함수 호출
    increaseViewCount(gseq);
    
    // 원하는 페이지로 이동
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
