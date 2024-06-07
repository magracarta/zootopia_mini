<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.contest li a { width:100%; display:block; } 
.contest .swiper-slide {  }
.contest .swiper-slide img { width:100%; }


.contest .title-wrapper { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom:60px; }
.contest .title-wrapper .title { font-size:30px; font-weight:600; }
.contest .title-wrapper a { font-size:15px; text-decoration: underline; }



.contest-category { padding-bottom: 60px; margin-top: -21px; }
.contest-category ul { display:flex;  }
.contest-category ul li { border-bottom:2px solid #F3F3F3; }
.contest-category ul li a { padding: 15px 15px; position:relative; top:2px; width:auto; font-size:18px; }
.contest-category ul li a.select { border-bottom:2px solid #000; font-weight: 800; color: #000; }

.contest_container {  }
.contest_container .contest_list {  }
.contest_container .contest_list ul {  }
.contest_container .contest_list ul li { padding:50px 45px; border:1px solid #CCCCCC; border-radius:5px; margin-bottom:50px; }
.contest_container .contest_list ul li.end { background:#f9f9f9; }
.contest_container .contest_list ul li.wating { background:#ffe2e2; }
.contest_container .contest_list ul li.end .listcpist .no_pet { background:#fff; }
.contest_container .contest_list ul li.rejected { background:#e0e9ed; }

.contest_container .contest_list ul li .date_num { font-size:15px; display:flex; justify-content: space-between; margin-bottom:0px; }
.contest_container .contest_list ul li .date_num .cseq { margin-left:15px; color:#999; font-weight:600; font-size:18px; }
.contest_container .contest_list ul li .date_num .lastdate { color:#FF4646; }

.contest_container .contest_list ul li .wating { padding:5px 20px; color:#fff; background:red; padding: 5px 20px; color: #fff; background: red;display: inline-block;
    margin-bottom: 14px; border-radius: 50px; font-size: 18px;}
.contest_container .contest_list ul li .left { display:flex; margin-bottom:20px; align-items: center; }

.contest_container .contest_list ul li .title-box {  }
.contest_container .contest_list .left-box { margin-top:-5px; text-align:right; }
.contest_container .contest_list .left-box p { margin-bottom:5px;display:block; color:#999; }
.contest_container .contest_list ul li .title-box h1 { font-size:20px; color:#000; font-weight:700; }
.contest_container .contest_list ul li .title-box p { font-size:15px; color:#333; margin-top:10px; }


.contest_container .contest_list ul li .listcpist { width:80%; overflow: hidden; margin-top: 30px; }
.contest_container .contest_list ul li .listcpist .swiper-slide { width:165px; padding-right:20px; position:relative; }
.contest_container .contest_list ul li .listcpist .swiper-slide img { width:100%; height:165px; object-fit: cover;}
.contest_container .contest_list ul li .listcpist .swiper-slide .rank { position:absolute; top:0; left:0; font-size:12px; color:#fff; background:rgba(0,0,0,0.5);
 width:37px; height:37px; display: flex; align-items: center; justify-content: center;}
.contest_container .contest_list ul li .listcpist .no_pet { height: 165px; display: flex; justify-content: center;
    align-items: center; font-size: 15px; font-weight: 600; color: #999; background: #f9f9f9; border-radius: 5px; }

.contest_container .bottom-wrap { display:flex; justify-content: space-between; justify-content: space-between;
    align-items: flex-end; }
.contest_container .contest_list {  }
.contest_container .contest_list .button-wrapper { text-align:right;  }
.contest_container .contest_list .button-wrapper p { color:#999999; font-size:15px; font-weight:600; }
.contest_container .contest_list .button-wrapper p.complete { color:#000; font-size: 18px; margin-bottom: 20px; }
.contest_container .contest_list .button-wrapper span { font-size: 18px;  }
.contest_container .contest_list .button-wrapper a { border-radius:5px; text-align:center;
margin-top:26px; width:auto; font-size:15px; color:#fff; background:#000; padding:11px 42px; }


.contest_detail {  }
.contest_detail .contestform {  }
.contest_detail .contestform {  }
.contest_detail .contestform form {  }
.contest_detail .contestform form > div { margin-top:65px; }

.contest_detail .contestform form > div span { display:block; margin-bottom:20px; 
font-size:15px; color:#333333; font-weight:500; }
.contest_detail .contestform form > div input { border:1px solid #D9D9D9; }
.contest_detail .contestform form > div textarea { border:1px solid #D9D9D9; }

.contest_detail .contestform form > div .button-wrap { width:362px; }
.contest_detail .contestform form > div .button-wrap a {  border:1px solid #D9D9D9; border-radius:3px; color:#a6a6a6; font-size:15px; display:flex; padding:15px; 
    justify-content: space-between; }
.contest_detail .contestform form > div .button-wrap.addPick a { color:#000; }
.contest_detail .contestform form > div .button-wrap a img { height:14px; transform: rotate(-90deg); }
.contest_detail .contestform form > div .button-wrap a.open img { transform: rotate(90deg); } 
.contest_detail .contestform form > div .select-container  { position:relative; }
.contest_detail .contestform form > div .select-container ul { 
display:none;box-shadow: 0px 15px 15px rgba(0, 0, 0, 0.12);
border:1px solid #D9D9D9; border-radius: 3px; width:362px; position:absolute; background:#fff;  top: 11px; z-index:2; overflow: hidden;}
.contest_detail .contestform form > div .select-container ul.open {  display:block;}
.contest_detail .contestform form > div .select-container ul li {  }
.contest_detail .contestform form > div .select-container ul li a { padding:15px; display:block; }
.contest_detail .contestform form > div .select-container ul li a.addPick ,
.contest_detail .contestform form > div .select-container ul li a:hover { background:#F8F8F8; }


.button_wrap {  }
.button_wrap input { background:#000; color:#fff; padding:15px 80px; border:none; border-radius: 5px; }
.button_wrap input:nth-child(2) { margin-left:20px; background:#fff; color:#000; border:1px solid #000; }




.contest_container .contest_list .button-wrapper a.watingText { pointer-events: none; text-align: center; background: #ddd; }
</style>



<style>
.contest .title-wrapper .detail_num { font-size: 15px; color:#999999; font-weight:600; margin-bottom:10px; display:block; }
.contest .title-wrapper p { color:#333; font-size:15px; display:block; margin-top:28px; }
.contest .title-wrapper pre { color:#333; font-size:15px; display:block; margin-top:28px; }
.contest .title-wrapper .right a { text-decoration: none; border:1px solid #000000; padding:15px 49px; border-radius:5px; font-weight:600; }

.contest_pet_list {  }
.contest_pet_list ul { display:flex; flex-wrap: wrap; justify-content: flex-start; }
.contest_pet_list ul li { width:calc(33.3333% - 40px); margin-right:60px; }
.contest_pet_list ul li:nth-child(3n) {  margin-right:0px; }
.contest_pet_list ul li .image-box { position:relative; }
.contest_pet_list ul li .image-box img { width:100%; height:393.32px; object-fit: cover; }
.contest_pet_list ul li .image-box .rank { width: 68px; height: 68px; font-size: 25px; display: flex;
    align-items: center; justify-content: center; background: rgba(0, 0, 0, 0.5);
    color: #fff; position: absolute; top: 0; left: 0; }
.contest_pet_list ul li .text-box { margin-bottom:100px;  }
.contest_pet_list ul li .text-box .kind_recommend { margin-top:20px; display:flex; justify-content: space-between;
    align-items: center;}
.contest_pet_list ul li .text-box .kind_recommend span { font-size:15px; color:#333333; }
.contest_pet_list ul li .text-box .kind_recommend span.tag { background:#373737; color:#fff; padding: 3px 13px; border-radius: 50px; }


.contest_pet_list ul li .text-box .content_box { margin-top:11px;  }
.contest_pet_list ul li .text-box .content_box .name { font-size:16px; font-weight:700; color:#000000;  }
.contest_pet_list ul li .text-box .content_box .gender { font-size:15px; color:#FF0000; }
.contest_pet_list ul li .text-box .content_box .gender.men { color:#2400FF; }
.contest_pet_list ul li .text-box .content_box .content {display:block; font-size:15px; color:#333; margin-top:10px;  }
.contest_pet_list ul li .text-box .recommnadButton { 
display:block; margin-top:18px;
font-size:15px; width:100%; text-align : center; padding:13px 0; color:#333; border:1px solid #333; }

.contest .detailinfo { font-size:13px; color:#999; font-weight:600; display:block; margin:0px 0 20px; }

.reply { margin-top:100px }
.reply > h2 { font-size:30px; font-weight:700; color:#000; margin-bottom:30px; }
.reply .submit_reply {  }

.contest_pet_list .more_pet {  }
.contest_pet_list .more_pet a { display:flex;  height:393.32px; flex-direction: column; 
justify-content: center; align-items: center; align-content: center; background:#D9D9D9; }
.contest_pet_list .more_pet .plus { position:relative; padding-top:25px; }
.contest_pet_list .more_pet .button { margin-top:50px;
display:block; color:#fff; font-size:15px; border:1px solid #fff; padding:11px 88px; border-radius:4px; }



/* 펫 폼 */
.petContainer {display:none;  position:fixed; top:0; left:0; width:100%; height:100%;  z-index:20;  align-items: center; justify-content: center; }
.overay { position:absolute; width:100%; height:100%; background:rgba(0,0,0,0.5);  top: 0; left: 0; z-index:1; }
.petContainer .createForm_wrapper { position:relative; z-index:2; max-width:1100px; margin:0 auto; background:#fff; width: 90%; }
.petContainer .createForm_wrapper .closeBtn { position:absolute; right:20px; top:20px; }
.petContainer .createForm_wrapper form { padding:30px 70px; }
.petContainer .createForm_wrapper form h3 { font-size:18px; margin-bottom:30px; color:#000; font-weight:600; }
.petContainer .createForm_wrapper form .cotainer { display:flex; align-items: flex-end; }
.petContainer .createForm_wrapper form .left { width:283px; }
.petContainer .createForm_wrapper form .left img { width:100%; height:283px; object-fit: cover;}
.petContainer .createForm_wrapper form .left input { display:none; }

.petContainer .createForm_wrapper form .right { width:70%;padding-left:30px; }
.petContainer .createForm_wrapper form .right > div { margin-top:30px; }
.petContainer .createForm_wrapper form .right > div .title { font-size:18px; color:#000; font-weight:700; }
.petContainer .createForm_wrapper form .right > div .content { font-size:18px; margin-left:15px; }
.petContainer .createForm_wrapper form .right > div textarea {margin-top:10px; height:151px; }
.petContainer .createForm_wrapper form .right .petname {  }
.petContainer .submitbutton_container { display:flex; justify-content: flex-end; margin-top:30px; }
.petContainer .submitbutton_container .submitbutton { background:#000; color:#fff; padding:12px 78px; border-radius:5px; border:none; }


.contestpetInfo_container { text-align:right; margin-bottom:20px; }
.contestpetInfo { color: #999; font-weight:700;
    display: inline-block; border-radius: 50px; margin-top: 10px; } 


/* 댓글 영역 */
.loginButton_ud { margin-top:10px; display: flex; text-align: center; }
.petUpdate , .petDelete { font-size:15px; color:#fff; background:#000; border:1px solid #000; border-radius:0px; padding:15px 0; }
.petDelete { color:#000; background:#fff; margin-left:10px; }

.submit_reply { padding:50px 0; }
.submit_reply form { display:flex; }
.submit_reply form .longin-info-box { width:100px; align-items: center;  }
.submit_reply form .longin-info-box img { width: 80px; height: 80px;
    overflow: hidden; border-radius: 50%; }
.submit_reply form .longin-info-box span { display:block; margin-top:8px; font-weight: 800; }
.submit_reply form .login-content { width: calc(100% - 100px); }
.submit_reply form .login-content textarea { border:1px solid #D9D9D9; }
.submit_reply form .login-content > div { text-align: right; margin-top:20px; }
.submit_reply form .login-content > div input[type="submit"] {padding:5px 15px; background:#000; color:#fff; border:1px solid #000; box-sizing: border-box; 
border-radius: 5px; margin:0 5px;  }



.reply_list {  }
.reply_list ul { margin-bottom:30px; }
.reply_list ul li {  padding:40px 0; border-top:1px solid #E3E3E3;  }
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
input[type='checkbox'] { width:25px; height:25px; padding:0; }
input[type='checkbox']:checked {
	background-image:url("images/checked.svg");
	background-size: cover; background-position:center;
	border-color: #000;
}

.button-container { display: flex; justify-content: space-between; align-items: center; position: fixed; bottom: 0;
    z-index: 10; background: #fff; box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2); padding: 20px 50px; left:50%;
    transform: translate(-50%, 0px); margin-bottom: 50px; border-radius: 50px; }
.button-container .allcheckbox { display:flex; align-items: center; }
.button-container .allcheckbox label { font-size: 18px; margin-left: 15px; margin-right: 30px; cursor:pointer; }
.button-container .allcheckbox input[type="checkbox"] {  }
.button-container .button-box { }
.button-container .button-box input[type="button"] { background:#fff; color:#000; padding:8px 35px; font-size:16px; border-radius:5px; margin-left:10px; }
.button-container .button-box input[type="button"]:hover { background:#000; color:#fff;  }

.contest_container .serach-form input[type="submit"] { padding:0 30px; }
.searchinfo { display: block; font-size: 20px; padding-bottom: 50px; color: #999; font-weight: 700;}

input[name="crseq"] { margin-right:15px;  }


.buttonbox { display: flex; justify-content: space-between; align-items: center; padding: 20px 0 50px;}
.buttonbox .allcheckbox { display: flex; align-items: center;  }
.buttonbox .allcheckbox label { font-size:16px; margin-left:15px; }
.buttonbox .button-box {  }
.buttonbox .button-box input { padding:10px 30px; border-radius:5px; font-size:15px; margin:0; }
.contest_pet_list li { position:relative; }
.contest_pet_list input[name="cpseq"] { position:absolute; top:10px; right:10px; z-index: 2; }
</style>