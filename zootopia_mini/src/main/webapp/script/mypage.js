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