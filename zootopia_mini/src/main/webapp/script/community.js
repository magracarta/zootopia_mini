

function deleteCommunity(gseq) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = 'zootopia.do?command=communityDelete&gseq=' + gseq;
    }
}

function updateCommunity() {
	let formDate = document.updateForm;
	if(formDate.subject.value == ""){
		alert("제목을 작성해 주세요.");
		formDate.subject.focus();
		 return false; 
	}else if(formDate.content.value == ""){
		alert("내용을 작성해 주세요.");
		formDate.content.focus();
		 return false; 
	}else if (confirm("정말로 수정하시겠습니까?")) {
        var theForm = document.updateForm;
        theForm.action = "zootopia.do?command=communityUpdate"; 
        theForm.submit(); 
        return true; 
    } else {
        return false; 
    }
    
}


$(document).ready(function() {
    $(".recommendButton").click(function() {
        var gseq = document.querySelector(".recommendButton").dataset.gesq;

        if (confirm("정말로 추천하시겠습니까?")) {
            $.ajax({
                url: "zootopia.do?command=communityRecommands",
                type: "POST",
                data: { gseq: gseq },
                success: function(data) {
                    var recommends = data.recommends;
                    $(".recommandWrap").text("추천 수[" + recommends + "]");
                },
                error: function(xhr, status, error) {
                    console.error("AJAX request failed: " + error);
                }
            });
        }
    });
});

function cancel() {
    var confirmed = confirm("작성을 취소하시겠습니까?");
    if (confirmed) {
        var href = "http://localhost:8090/zootopia_mini/zootopia.do?command=communityBoard"; 
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
    increaseViewCount(gseq);
    

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
    
    
function deleteCommunityReply(grseq, gseq) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = 'zootopia.do?command=deleteCommunityReply&grseq=' + grseq + '&gseq=' + gseq;
    }

}


function communityCreate(){
	let formDate = document.communityForm;
	if(formDate.subject.value == ""){
		alert("제목을 작성해 주세요.");
		formDate.subject.focus();
		 return false; 
	}else if(formDate.content.value == ""){
		alert("내용을 작성해 주세요.");
		formDate.content.focus();
		 return false; 
	}
	return true; 
}