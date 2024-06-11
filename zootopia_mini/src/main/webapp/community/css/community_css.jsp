<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	
.container {     margin-bottom: 60px; }
.container .title { line-height: 3; font-size: large;}

.head{
    display: flex;
    justify-content: space-between;
align-items: baseline;
}
.head .write{
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
}

.head .write:hover{
            background-color: black;
            color: white;
            border:1px solid black;
}

.container .kind0{
    background: white;
    border: 1px solid black;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}

.container .kind1{
    background: white;
    border: 1px solid black;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}

.container .kind2{
    background: white;
    border: 1px solid black;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}

.container .kind3{
    background: white;
    border: 1px solid black;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
}

.container .kind0:hover{
            background-color: black;
            color: white;
            border:1px solid black;
}
.container .kind1:hover{
            background-color: black;
            color: white;
            border:1px solid black;
}
.container .kind2:hover{
            background-color: black;
            color: white;
            border:1px solid black;
}
.container .kind3:hover{
            background-color: black;
            color: white;
            border:1px solid black;
}
.communityboard	{  }
.communityboard ul	{  }
.communityboard ul li	{ padding: 14px 0; border-bottom: 1px solid #ddd; }
.communityboard ul li	{ padding: 14px 0; border-bottom: 1px solid #ddd; }
.communityboard ul .board_head{
	font-weight: bold;
  background: #f7f7f7;
}
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


/* community detail*/

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

.button_container .button1,
.button_container .button2 {
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  color: #fff;
}
.button_container .button1 {
    background: white;
    border: 1px solid black;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;}

.button_container .button2 {
    background: black;
    color: white;
    padding: 5px 6px;
    border-radius: 5px;
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

.detailcontainer .content	{ width: 100%; }

.detailcontainer .content .button3{
    background: white;
    border: 1px solid black;
    color: black;
    padding: 5px 6px;
    border-radius: 5px;
    }
    
.detailcontainer .content .button3:hover{
            background : black;
            color: white;
            border:1px solid black;
    }

.detailcontainer .content	p { 
display:flex; 
text-align:left; 
padding:30%;
font-size: large;
padding-top: 20px; 
padding-left: 20px;
}

 .comment-section {
margin: 0 auto;
}

.comment2 {
font-size: 24px;
margin-bottom: 10px;
border-bottom: 2px solid #333;
padding-bottom: 5px;
padding-top: 50px;
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
            margin-top: 20px;
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
    padding: 0px;
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














</style>