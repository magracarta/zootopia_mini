<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	
.container {  }
.container .title { line-height: 3; font-size: large;}

.communityboard	{  }
.communityboard ul	{  }
.communityboard ul li	{ padding: 14px 0; border-bottom: 1px solid #ddd; }
.communityboard ul li.board_head	{ display: flex; justify-content: space-between; }
.communityboard ul li a	{ display: flex; justify-content: space-between; }
.communityboard ul li .num	{ width: 5%; }
.communityboard ul li .subject	{ width: 60%; text-align: left; }
.communityboard ul li .userid	{ width: 15%; text-align: center; }
.communityboard ul li .createdate	{ width: 20%; text-align: left; }
.communityboard ul li .recommands	{ width: 5%; text-align: center; }
.communityboard ul li .vcount	{ width: 5%; text-align: center; }

.header {
    display: flex;
    justify-content: space-between;
    align-items: center; /* 제목과 버튼을 수직 가운데 정렬 */
    background-color: #f2f2f2; /* 예시 배경색 */
    padding: 10px 20px; /* 예시 패딩값 */
}

.header h2 {
    margin: 0; /* 제목의 상단 및 하단 마진 제거 */
}

.header input[type="button"] {
    background-color: #4CAF50; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    border: none; /* 테두리 없애기 */
    padding: 10px 20px; /* 패딩값 */
    text-align: center; /* 텍스트 가운데 정렬 */
    text-decoration: none; /* 밑줄 없애기 */
    display: inline-block;
    font-size: 16px;
    margin-left: 10px; /* 버튼과 제목 사이 간격 조절 */
}

.detailcontainer	{  }
.detailcontainer ul	{  }
.detailcontainer ul li	{ padding: 14px 0; border-bottom: 1px solid #ddd; }
.detailcontainer ul li.board_head	{ display: flex; justify-content: space-between; }
.detailcontainer ul li a	{ display: flex; justify-content: space-between; }
.detailcontainer ul li .num	{ width: 5%; }
.detailcontainer ul li .subject	{ width: 60%; text-align: left; }
.detailcontainer ul li .userid	{ width: 15%; text-align: center; }
.detailcontainer ul li .createdate	{ width: 20%; text-align: left; }
.detailcontainer ul li .recommands	{ width: 5%; text-align: center; }
.detailcontainer ul li .vcount	{ width: 5%; text-align: center; }













</style>