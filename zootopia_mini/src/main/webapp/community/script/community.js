function maskUserId(userId) {
    if (userId === null || userId.length <= 2) {
        return userId;
    }

    var prefix = userId.substring(0, 2); // 앞 두 자리를 추출합니다.
    var masked = userId.substring(2).replace(/./g, '*'); // 나머지 자리를 별표로 처리합니다.

    return prefix + masked;
}

function goToUpdatePage(gseq) {
    var url = "zootopia.do?command=communityUpdate&gseq=" + gseq;
    location.href = url;
}

function recommend(gseq) {
    // 서버에 추천 요청을 보냅니다.
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "zootopia.do?command=recommendCommunity&gseq=" + gseq, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // 요청이 성공적으로 처리되었을 때 추천 수를 업데이트합니다.
            var count = parseInt(xhr.responseText);
            if (!isNaN(count)) {
                // 추천 수를 화면에 업데이트합니다.
                document.getElementById("recommends_" + gseq).innerHTML = count;
            }
        }
    };
    xhr.send();
}