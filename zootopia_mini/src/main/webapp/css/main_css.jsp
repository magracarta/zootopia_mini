<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.section-common { padding:130px 0 0; }
.section-common h2 { font-size:30px; color:#000; padding-bottom:15px; font-weight: 600; }
.section-common p { font-size:15px; padding-bottom:50px;  }
.button-wrap { text-align: center; margin-top:50px; }
.moreBtn { font-size: 15px; padding:20px 104px; margin:0 auto; display:inline-block; border:1px solid #999; border-radius: 5px; }

#populart-contest .list-container {  }
#populart-contest .list-container > ul { display: flex; }
#populart-contest .list-container > ul > li { width:33.3333%; }
#populart-contest .list-container > ul > li:nth-child(2) { margin:0 60px; }
#populart-contest .list-container > ul > li .img-box { width:100%; height:393px; background:#f5f5f5; color:#999; display:flex;
padding:0; align-content: center; justify-content: center; align-items: center; flex-direction: column; text-align: center; }
#populart-contest .list-container > ul > li .img-box img { width:100%; height:393px; object-fit: cover; }
#populart-contest .list-container > ul > li .img-box img.plus { width:76px; height:76px !important; margin-top:50px; }
#populart-contest .list-container > ul > li .img-box > p { display:block; margin-top:50px; }
#populart-contest .list-container > ul > li .text-box { padding-right:35px; }
#populart-contest .list-container > ul > li .text-box .subject { font-size: 25px; display:block; color:#000; padding-top:16px;
font-weight: 700; }
#populart-contest .list-container > ul > li .text-box .content { padding-top:10px; display:block; font-size: 15px; }


#populart-contest .list-container > ul > li .pet-second-third {  padding-right:35px; margin-top:40px;  }
#populart-contest .list-container > ul > li .pet-second-third ul {  }
#populart-contest .list-container > ul > li .pet-second-third ul li { display:flex; }
#populart-contest .list-container > ul > li .pet-second-third ul li:nth-child(2) { margin-top:25px; padding-top:25px;  border-top:1px solid #ddd;}
#populart-contest .list-container > ul > li .pet-second-third ul li .ts_img-box { width:87px; height:87px; margin-right:12px; }
#populart-contest .list-container > ul > li .pet-second-third ul li .ts_img-box img { width:100%; height: 100%; object-fit: cover; }
#populart-contest .list-container > ul > li .pet-second-third ul li .ts_text-box { width:calc(100% - 87px); padding-right:30px; }
#populart-contest .list-container > ul > li .pet-second-third ul li .ts_text-box .petname { font-size:20px; color:#000; font-weight:500; }
#populart-contest .list-container > ul > li .pet-second-third ul li .ts_text-box .content { display:block; font-size:15px; margin-top:10px; }


.skiptext { overflow: hidden; white-space: normal; text-overflow: ellipsis;  display: -webkit-box !important;
  -webkit-line-clamp: 2; -webkit-box-orient: vertical; word-break: keep-all;   }
  
  
  
.communityboard   {  }
.communityboard ul   {  }
.communityboard ul li   { padding: 25px 20px; border-bottom: 1px solid #ddd; }
.communityboard ul li.board_head   { display: flex; justify-content: space-between; font-weight:800; background: #f7f7f7; }
.communityboard ul li a   { display: flex; justify-content: space-between; }
.communityboard ul li .num   { width: 5%; }
.communityboard ul li .subject   { width: 60%; text-align: left; }
.communityboard ul li .userid   { width: 15%; text-align: center; }
.communityboard ul li .createdate   { width: 20%; text-align: left; }
.communityboard ul li .recommands   { width: 5%; text-align: center; }
.communityboard ul li .vcount   { width: 5%; text-align: center; }
  
.no-data { width: 100% !important; padding: 50px 0 !important; text-align: center; background: #f1f1f1; border-radius: 5px; }
</style>




  <script>
  var swiper = new Swiper(".mySwiper", {
      pagination: {
        el: ".swiper-pagination",
        type: "fraction",
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  
  
  setTimeout(()=>{
	  resize();
	  
  },100);
  
 
  //반응형 
  function resize(){
	  let imgs = document.querySelectorAll(".img-box img");
	  let width = imgs[0].width;
	  
	  for(img of imgs){
		  img.style.height = width+'px';
	  }
  }
  </script>