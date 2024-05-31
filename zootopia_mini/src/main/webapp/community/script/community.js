function confirmDelete() {
        if(confirm("삭제하시겠습니까?")) {
            // '예'를 선택했을 경우
            location.href='zootopia.do?command=deleteCommunity&gseq=${communityVO.gseq}';
        } else {
            // '아니오'를 선택했을 경우
            return false;
        }
    }