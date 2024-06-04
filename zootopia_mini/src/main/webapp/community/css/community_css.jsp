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

section {border: 2px solid; }
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 2%;
    border-bottom: 1px solid #ddd;
}

.header h2 {
    font-size: larger;
    font-weight: bolder;
    color: palevioletred;
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
.detailcontainer ul li {
    padding: 20px;
    border-bottom: 1px solid #ddd;
}
.detailcontainer ul li a	{ 
display: flex;
}
.detailcontainer ul li .num	{ 
width: 5%;     
color: red;
}
.detailcontainer ul li .subject	{ 
width: 60%; 
text-align: left; 
font-weight: bold;
}
.detailcontainer ul li .userid	{ 
width: 15%; 
text-align: center; 
}
.detailcontainer ul li .createdate	{ width: 10%; text-align: left; }
.detailcontainer ul li .recommands	{ width: 15%; text-align: center; }
.detailcontainer ul li .recommands .content	{ width: 5%; text-align: center; }
.detailcontainer ul li .vcount	{ width: 10%; text-align: center; }
.detailcontainer .content	{ width: 100%; }
.detailcontainer .content	p { display:flex; text-align: left; background-color: lightgray; padding:30%;
												font-size: large;padding-top: 20px; padding-left: 20px;}

.button_container {
  display: flex;
  justify-content: space-around; /* 버튼 가운데 정렬 */
  margin-top: 10px; /* 버튼과 게시물 간격 조정 */
}

.button_container .button1,
.button_container .button2 {
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  color: #fff;
}
.button_container .button1 {
  background-color: #007bff !important; /* 버튼 1 배경색 */
}

.button_container .button2 {
  background-color: #dc3545; /* 버튼 2 배경색 */
}



/* NO. 20 */

position: absolute;
width: 48px;
height: 22px;
left: 310px;
top: 159px;

font-family: 'Noto Sans KR';
font-style: normal;
font-weight: 500;
font-size: 15px;
line-height: 22px;
/* identical to box height */

color: #999999;







</style>