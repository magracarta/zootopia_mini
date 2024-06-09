<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	
.container {  }
.container .title { line-height: 3; font-size: large;}

.head{
    display: flex;
    justify-content: space-between;
align-items: baseline;
}
.head .write{
    background-color: lightgray; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    border: none; /* 테두리 없애기 */
    padding: 10px 20px; /* 패딩값 */
    text-align: center; /* 텍스트 가운데 정렬 */
    text-decoration: none; /* 밑줄 없애기 */
    display: inline-block;
    font-size: 16px;
    margin-left: 10px;
    color: black;
}

.container .kind0{
    background: gainsboro;
    border: none;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}

.container .kind1{
    background: gainsboro;
    border: none;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}

.container .kind2{
    background: gainsboro;
    border: none;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}

.container .kind3{
    background: gainsboro;
    border: none;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}

.container .kind4{
    background: gainsboro;
    border: none;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}
.communityboard	{  }
.communityboard ul	{  }
.communityboard ul li	{ padding: 14px 0; border-bottom: 1px solid #ddd; }
.communityboard ul li	{ padding: 14px 0; border-bottom: 1px solid #ddd; }
.communityboard ul .hottopic	{ 
 background: lightgray; 
 border-bottom: 1px solid #ddd;
 }
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
    color: black; /* 버튼 텍스트 색상 */
    border: none; /* 테두리 없애기 */
    padding: 10px 20px; /* 패딩값 */
    text-align: center; /* 텍스트 가운데 정렬 */
    text-decoration: none; /* 밑줄 없애기 */
    display: inline-block;
    font-size: 16px;
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
  background-color: black !important; /* 버튼 1 배경색 */
}

.button_container .button2 {
  background-color: lightgray; /* 버튼 2 배경색 */
  color:black;
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

.commenth2{

}

.commentwrite{

}

.commentwrite .write{
    color: black;
    font-size: large;
}

.commentwrite .submit{
padding: 3px 5px;
    text-align: center;
    font-size: larger;
    font-weight: bold;
}

.comment-list{

}

.comment-list .commentbox{
    border: 1px solid black;
    padding-top: 5px;
    /* padding: 5px; */
    margin-top: 10px;
}














.serach-form {
    display: flex;
    justify-content: center;
    margin-top: 50px;
}

.serach-form input[name="findcommunity"] {
    width: 287px;
    border-radius: 5px;
    border: 1px solid #D9D9D9;
    height: 45px;
    margin-right: 5px;
    display: inline-block;
}

.serach-form input[type="button"] {
    height: 45px;
    color: #fff;
    background: #000;
    border: none;
    border-radius: 4px;
}

.communityform{

}

.communityform .form {
    display: flex;
    padding: 10px;
    text-align: center;
    font-size: xx-large;
    font-weight: bold;

}

.communityform .detail{
    display: flex;
    width: 100%;
    flex-direction: row;
    align-items: baseline;
}

.communityform .detail .writer{
	width: 80px;
    text-align: left;
    padding: 15px 0;
    font-weight: bold;
    font-size: larger;
}

.communityform .detail .userid{
    border: none;
}

.communityform .detail .nickname{
    border: none;
    padding-right: 10px;    
}

.communityform .kind label {
    font-size: large;
    font-weight: bold;	
}

.communityform .kind .kindlist {
	width: 10%;
    text-align: center;
}

.communityform .kind .kindlist .list1 {
	width: 10%;
    text-align: center;
    
}
 
 .communityform .kind .kindlist .list1 {
	width: 10%;
    text-align: center;
}

.communityform .kind .kindlist .list1 {
	width: 10%;
    text-align: center;
}
.communityform .class {
}
.communityform .class label {
	font-size: larger;
    font-weight: bold;	
}

.communityform .class .text{

}

.communityform .content label{

}

.communityform .content .content{
height: 300px;
}

.communityform .btn{
    color: white;
    border: none;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    margin-left: 10px;
}

.communityform .btn .button3{
    padding: 20px;
    color: white;
    background: black;
        border: none;
}

.communityform .btn .button4{
    padding: 20px;
    color: black;
    background: lightgray;
        border: none;
}





</style>