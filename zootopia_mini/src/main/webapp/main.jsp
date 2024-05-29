<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>

<section id ="mainslide">
	<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide">
	      	<div class="banner-01 banner">
	      		<img src="images/banner01.jpg">
	      		<div class="title">
	      			<h1>타이틀1</h1>
		      		<span>부재입니다 부재입니다 부재입니다. 부재입니다.</span>
	      		</div>
	      	</div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="banner-01 banner">
	      		<img src="images/banner01.jpg">
	      		<div class="title">
	      			<h1>타이틀2</h1>
		      		<span>부재입니다 부재입니다 부재입니다. 부재입니다.</span>
	      		</div>
	      	</div>
	      </div>
	      
	      <div class="swiper-slide">
	      	<div class="banner-01 banner">
	      		<img src="images/banner01.jpg">
	      		<div class="title">
	      			<h1>타이틀2</h1>
		      		<span>부재입니다 부재입니다 부재입니다. 부재입니다.</span>
	      		</div>
	      	</div>
	      </div>
	    </div>
	     <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-pagination"></div>
 	 </div>
  
</section>

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
  </script>

<%@ include file ="footer.jsp" %>