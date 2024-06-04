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

section {  }
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 3px solid #ddd;
}

.header .text{
    width: 100%;
}

.header .num {
padding: 1%;
}

.header .top {

}

.header .title{
    display: flex;
    font-size: x-large;
    font-weight: bold;
    padding: 10px;
    text-align: left;
}

.header .namerecomreply {
    display: flex;
}

.header .namerecomreply .nickname {
padding: 1%;
}

.header .namerecomreply .recommands {
    padding: 1%;
}

.header .namerecomreply .vcount {
    padding: 1%;
}

.header .buttondiv{

}

.header .buttondiv .button_container{

}

.detailcontainer input[type="button"] {
    background-color: lightgray; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    border: none; /* 테두리 없애기 */
    padding: 10px 20px; /* 패딩값 */
    text-align: center; /* 텍스트 가운데 정렬 */
    text-decoration: none; /* 밑줄 없애기 */
    display: inline-block;
    font-size: 16px;
    margin-left: 10px; /* 버튼과 제목 사이 간격 조절 */
}

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


.detailcontainer .content	{ width: 100%; }


.detailcontainer .content	p { 
isplay:flex; 
text-align:left; 
padding:30%;
font-size: large;
padding-top: 20px; 
padding-left: 20px;
}






</style>