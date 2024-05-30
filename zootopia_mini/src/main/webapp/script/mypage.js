document.addEventListener('DOMContentLoaded', () => {
    const pwd = document.getElementById('pwd');
    const confirmPwd = document.getElementById('confirm-pwd');
    const errorText = document.getElementById('error-text');

    const checkPasswordMatch = () => {
        if (pwd.value === confirmPwd.value) {
            errorText.style.display = 'none';
        } else {
            errorText.style.display = 'block';
        }
    };

    pwd.addEventListener('input', checkPasswordMatch);
    confirmPwd.addEventListener('input', checkPasswordMatch);
});


function confirmDelete(event) {
            event.preventDefault();
            if (confirm("정말 탈퇴하시겠습니까?")) {
                alert("회원 탈퇴가 완료되었습니다");
                window.location.href = "zootopia.do?command=index.jsp"; // 메인 페이지로 이동
            }
        }