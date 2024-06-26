<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
   
.container {     margin-bottom: 60px; }
.container .title { font-size: 30px; font-weight: 600; }

.head{
    display: flex;
    justify-content: space-between;
align-items: baseline;
 margin-bottom: 60px;
}
/* .head .write{
    background-color: white;
    color: white;
    border: 1px solid black;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-left: 10px;
    color: black;
} */
 
.head .write{  font-size: 15px; text-decoration: underline; background: none; border: none; color: #555; cursor: pointer;   }

/* .head .write:hover{
            background-color: black;
            color: white;
            border:1px solid black;
} */



.communityboard   {  }
.communityboard ul   {  }
.communityboard ul li   { padding: 22px 15px; border-bottom: 1px solid #ddd; }
.communityboard ul .board_head{ font-weight: bold; color:#000; }
.communityboard ul .hottopic   { 
 background: lightgray; 
 border-bottom: 1px solid #ddd;
     background: #f3f3f3;
    border-bottom: 1px solid #ddd;
    border-left: 5px solid #0198;
 }
.communityboard ul li.board_head   { display: flex; justify-content: space-between; }
.communityboard ul li a   { display: flex; justify-content: space-between; }
.communityboard ul li .num   { width: 6%; margin-right: 20px; text-align: center; }
.communityboard ul li .num > span { background: #0198; color: #fff; padding: 5px 8px; border-radius: 50px; font-size: 12px; }
.communityboard ul li .subject   { width: 60%; text-align: left; }
.communityboard ul li .userid   { width: 15%; text-align: center; }
.communityboard ul li .createdate   { width: 20%; text-align: left; }
.communityboard ul li .recommands   { width: 5%; text-align: center; }
.communityboard ul li .vcount   { width: 5%; text-align: center; }


/* community detail*/

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ddd;
   
}


.header .text{
    width: 100%;
}

.header .num {
margin-bottom:30px;
font-weight:bold;
color:#999; display:block;
}

.header .top {

}

.header .title{
    display: flex;
    font-size: 25px;
    font-weight: bold;
    padding: 0 0 40px 0;
    text-align: left;
}

.header .namerecomreply {
    display: flex;
    margin-bottom: 30px;
    color: #999;
}
.header .namerecomreply .image_box{
width:50px; 
height:50px; 
overflow: hidden; 
border-radius: 50%; 
}
.header .namerecomreply .image_box img {
 width:100%; 
 height:100%; 
 object-fit: cover; 
 }

.header .namerecomreply .nickname {
}

.header .namerecomreply .recommands {
}
.header .namerecomreply .recommands button { 
   padding:5px 10px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    border: 1px solid black;
    color: #fff;
    margin-left: 9px;
    background:#000;
 }

.header .namerecomreply > * {
 display: flex;
  display: flex;
 align-content: center;
 align-items: center;
 margin-right:20px;
}

.header .buttondiv{

}

.header .buttondiv .button_container{

}



.detailcontainer input[type="button"] {
    background-color: lightgray;
    color: black;
    border: none;
    padding: 10px 20px; 
    text-align: center; 
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

.button_container {
  display: flex;
  justify-content: space-around; 
  margin-top: 10px;
}

.button_container .button1 ,
.button_container .button2 {
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
   border: 1px solid black;
   color: black;
    margin-left: 9px;
    font-size: 15px;
}


.button_container .button2 {
    background: black;
    color: white;
}
.button_container .button1:hover {
            background : black;
            color: white;
            border:1px solid black;
}

.button_container .button2:hover {
            background-color: white;
            color: black;
            border: 1px solid black;
}

.detailcontainer .content   { width: 100%; }

.detailcontainer .content .button3{
    background: white;
    border: 1px solid black;
    color: black;
    padding: 15px 29px;
    border-radius: 5px;
    }
.detailcontainer .content .buttonWrap { display:flex;  }
.detailcontainer .content .button3.recommendButton  {
   background:#000; color:#fff; cursor: pointer; margin-right:13px;
}
    
.detailcontainer .content .button3:hover{
            background : black;
            color: white;
            border:1px solid black;
    }
.detailcontainer .content .button3.recommendButton:hover{
   background:#fff; color:#000; 
}
.detailcontainer .content pre {
display:flex; 
text-align:left; 
padding:30px 0 100px;
font-size: large;
}

.detailcontainer .content   p { 
display:flex; 
text-align:left; 
padding:30px 0 100px;
font-size: large;
}

 .comment-section {
margin: 0 auto;
}

.comment2 {
font-size: 24px;
margin-top:60px;
margin-bottom: 30px;
padding-top: 30px;

    border-top: 1px solid #ddd;
}

.commentwrite {
display: flex;
flex-direction: column;
margin-bottom: 20px;
}

.commentwrite textarea.write {
width: 100%;
height: 100px;
padding: 10px;
margin-bottom: 10px;
border-radius: 5px;
border: 1px solid #ccc;
font-size: 16px;
}

/* community reply */
.commentwrite button.submit {
    align-self: flex-end;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: black;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.commentwrite button.submit:hover {
    background-color: white;
    color: black;
    border:1px solid black;
}

.commentslist {
    margin-top: 80px;
}

.commentslist ul {
    list-style-type: none;
    padding: 0;
}

.commentslist li {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    margin-bottom: 10px;
    background-color: #f9f9f9;
}

.comment-content p {
    margin: 0;
}

        .comment-meta {
display: flex;
    align-items: flex-end;
    margin-top: 10px;
        }

        .comment-meta .image_box {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 10px;
        }

        .comment-meta .image_box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .comment-meta .user-info {
            display: flex;
            align-items: center;
        }

        .comment-meta .user-info span {
            margin-left: 10px;
            font-size: 14px;
            color: #666;
        }

        .comment-meta form {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            margin-top: 10px;
        }

        .comment-meta form textarea {
            width: 100%;
            height: 60px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 5px;
            font-size: 14px;
        }

        .comment-meta form button {
            padding: 5px 10px;
            font-size: 14px;
            color: #fff;
            background-color: #000;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .comment-meta form button:hover {
            background-color: #333;
        }

      
        .commentslist form .fin ,
        .commentslist form .delete {
            padding: 5px 10px;
            font-size: 14px;
            color: #fff;
            background-color: #000;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            border: 1px solid #000;
        }
        
        .commentslist form .delete { background:#fff; color:#000; }

      .commentslist form .fin:hover {
            background-color: white;
            color: black;
            border:1px solid black;
        }
      
      .commentslist form .delete:hover {
            background-color: black;
            color: white;
            border:1px solid black;
        }

        .comment-meta input.delete:hover {
            background-color: #333;
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

/* CommunityWrite */

.communityform{

}
.communityform > *{
   padding-bottom:35px;
}
.communityform .form {
    display: flex;
    padding-bottom: 30px;
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
       width: 7%;
    text-align: center;
    padding: 0px;
    height: 37px;
    margin-left: 20px;
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
.communityform .content label,
.communityform .class label {
   font-size: larger;
    font-weight: bold;
    padding-bottom:20px;
    display: block;   
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
    border:1px solid #000;
}

.communityform .btn .button4{
    padding: 20px;
    color: black;
    background: white;
        border: 1px solid black;
}

.communityform .btn .button3:hover{
   background-color: white;
   color: black;
}

.communityform .btn .button4:hover{
      background-color: black;
   color: white;
    border:1px solid black;
}

/* community update */

/* 전체 폼을 대상으로 합니다 */
.updateForm {
    /* 폼에 대한 스타일을 여기에 적용하세요 */
}

/* 섹션 제목을 대상으로 합니다 */
.updateForm .section-title {
    font-weight: bold;
    font-size: larger;
}

.updateForm .field1{
    margin-top: 10px;
}

/* 제목 입력 필드를 대상으로 합니다 */
.updateForm .field1 label {
   font-size: large;
   font-weight: bold
}

.updateForm .field1 .subject{
text-align: left;
    font-size: large;
    margin-top: 10px;
}

.updateForm .field2{
    margin-top: 10px;
}

/* 제목 입력 필드를 대상으로 합니다 */
.updateForm .field2 label {
   font-size: large;
   font-weight: bold
}

.updateForm .field2 .subject{
text-align: left;
    font-size: large;
    margin-top: 10px;
}

.updateForm .field3{
    margin-top: 10px;
}

.updateForm .field3 label {
   font-size: large;
   font-weight: bold
}

.updateForm .field3 .kind{
margin: inherit;
    margin-bottom: 20px;
    font-weight: bolder;
    text-align: center;
    display: flex;
    width: 80px;
   padding: 0;
}

.updateForm .field3 .kind .1{

}

.updateForm .field3 .kind .2{

}

.updateForm .field3 .kind .3{

}

/* 수정완료 버튼을 대상으로 합니다 */
.updateForm .btn-group .btn1 {
    font-size: large;
    background: black;
    color: white;
    padding: 5px;
    border: none;
}

/* 취소 버튼을 대상으로 합니다 */
.updateForm .btn-group .btn2 {
 font-size: large;
    background: white;
    color: black;
    padding: 5px;
    border: 1px solid black;
}

.updateForm .btn-group .btn1:hover {
   background-color: white;
   color: black;
}

.updateForm .btn-group .btn2:hover {
      background-color: black;
   color: white;
    border:1px solid black;
}



/* 카테고리 리스트 */

.contest-category { padding-bottom: 60px; margin-top: -21px; }
.contest-category ul { display:flex;  }
.contest-category ul li { border-bottom:2px solid #F3F3F3; }
.contest-category ul li a { padding: 15px 15px; position:relative; top:2px; width:auto; font-size:18px; }
.contest-category ul li a.select { border-bottom:2px solid #000; font-weight: 800; color: #000; }






.reply_list {  }
.reply_list ul { margin-bottom:30px; }
.reply_list ul li {  padding:20px 0; border-top:1px solid #E3E3E3;  }
.reply_list ul li:last-child {  border-bottom:1px solid #E3E3E3;   }
.reply_list ul li .top { display:flex; align-items: center; }
.reply_list ul li .image_box { width:80px; height:80px; overflow: hidden; border-radius: 50%; margin-right:36px;  }
.reply_list ul li .image_box img { width:100%; height:100%; object-fit: cover; }
.reply_list ul li .text-box { width:calc(85% - 80px); }
.reply_list ul li .text-box span { display: block; }
.reply_list ul li .text-box span:first-child { margin-bottom:10px;font-weight: 800; }
.reply_list ul li .button-box { width:calc(25% - 80px);  text-align: right; }

.reply_list ul li .button-box p { font-size: 15px; color:#959595; font-weight: 500; }

.reply_list ul li .replyUpdateForm { margin-top:30px; }
.reply_list ul li .replyUpdateForm textarea { height: 60px; border:1px solid #D9D9D9; }
.reply_list ul li .replyUpdateForm .button_box { display:flex; justify-content: flex-end;
align-items: center; margin-top:20px;}

.reply_list ul li .replyUpdateForm .button_box input { padding:5px 15px; background:#000; color:#fff; border:1px solid #000; box-sizing: border-box; 
border-radius: 5px; margin:0 5px;
}
.reply_list ul li .replyUpdateForm .button_box .delete { display:inline-block; width:auto; background: #fff; color:#000; }








</style>