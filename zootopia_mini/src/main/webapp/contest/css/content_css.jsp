<style>
.contest li a { width:100%; display:block; } 
.contest .swiper-slide {  }
.contest .swiper-slide img { width:100%; }


.contest .title-wrapper { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom:60px; }
.contest .title-wrapper .title { font-size:30px; font-weight:600; }
.contest .title-wrapper a { font-size:15px; text-decoration: underline; }

.contest_container {  }
.contest_container .contest_list {  }
.contest_container .contest_list ul {  }
.contest_container .contest_list ul li { padding:50px 45px; border:1px solid #CCCCCC; border-radius:5px; margin-bottom:50px; }
.contest_container .contest_list ul li {  }

.contest_container .contest_list ul li .date_num { font-size:15px; display:flex; justify-content: space-between; margin-bottom:0px; }
.contest_container .contest_list ul li .date_num .cseq { color:#999; font-weight:600; }
.contest_container .contest_list ul li .date_num .lastdate { color:#FF4646; }


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
.contest_container .contest_list .button-wrapper p.complete { color:#ddd; }
.contest_container .contest_list .button-wrapper span {  }
.contest_container .contest_list .button-wrapper a { border-radius:5px;
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
.button_wrap input:last-child { margin-left:20px; background:#fff; color:#000; border:1px solid #000; }




</style>



<style>
.contest .title-wrapper .detail_num { font-size: 15px; color:#999999; font-weight:600; margin-bottom:10px; display:block; }
.contest .title-wrapper p { color:#333; font-size:15px; display:block; margin-top:28px; }
.contest .title-wrapper .right a { text-decoration: none; border:1px solid #000000; padding:15px 49px; border-radius:5px; font-weight:600; }

.contest_pet_list {  }
.contest_pet_list ul { display:flex; flex-wrap: wrap; justify-content: space-between; }
.contest_pet_list ul li { width:calc(33.3333% - 40px); }
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
</style>