
function maskUserID(userid) {
    if (userid.length <= 2) return "***"; // 아이디의 길이가 2 이하인 경우 예외 처리
    
    const maskedPortion = userid.substring(0, userid.length - 2); // 뒤에서 2글자를 제외한 부분을 추출
    const lastTwoChars = userid.substring(userid.length - 2); // 아이디의 뒤에서 2글자를 추출
    const maskedLastTwoChars = lastTwoChars.replace(/./g, "*"); // 별표로 치환
    
    return maskedPortion + maskedLastTwoChars; // 별표로 처리된 뒤의 2글자를 포함한 아이디 반환
}