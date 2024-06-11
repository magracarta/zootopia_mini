



function confirmDelete(event) {
            event.preventDefault();
            if (confirm("정말 탈퇴하시겠습니까?")) {
                alert("회원 탈퇴가 완료되었습니다");
                window.location.href = "zootopia.do?command=index.jsp"; // 메인 페이지로 이동
            }
        }
 function go_updateMember(){
let form = document.modifyForm;

    if (form.userid.value == "") {
        alert("아이디를 입력해 주세요.");
        form.userid.focus();
        return false;
    } else if (form.pwd.value == "") {
        alert("비밀번호를 입력해 주세요.");
        form.pwd.focus();
        return false;
    } else if (form.pwd.value != form.pwd_check.value) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        form.pwd_check.focus();
        return false;
    } else if (form.name.value == "") {
        alert("이름을 입력해 주세요.");
        form.name.focus();
        return false;
    } else if (form.email.value == "") {
        alert("이메일을 입력해 주세요.");
        form.email.focus();
        return false;
    } else if (form.nickname.value == "") {
        alert("닉네임을 입력해 주세요.");
        form.nickname.focus();
        return false;
    } else if (form.phone.value == "") {
        alert("전화번호를 입력해 주세요.");
        form.phone.focus();
        return false;
    } else if (form.petname.value == "") {
        alert("반려견 이름을 입력해 주세요.");
        form.petname.focus();
        return false;
    } else if (form.kind.value == "") {
        alert("반려견 종류를 선택해 주세요.");
        form.kind.focus();
        return false;
    } else if (form.petgender.value == "") {
        alert("반려견 성별을 선택해 주세요.");
        form.petgender.focus();
        return false;
    } else {
        form.submit();
    }
}







