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

<section id="populart-contest" class="section-common">
	<h2>지금 인기있는 콘테스트</h2>
	<p>최근 7일간 떠오르는 콘테스트를 구경해 보세요!</p>
	<div class="list-container">
		<ul>
		<c:if test="${contestList.size() == 0}"><li class="no-data">최근 추가된 내용이 없습니다....</li></c:if>
		<c:forEach items="${contestList}" var="list">
			<li>
				
				<a href="zootopia.do?command=contestcount&cseq=${list.cseq}&contestDetailCount=1">
					<div class="img-box">
						<c:if test="${list.cpdList[0].saveimage != null}">
							<img src="images/${list.cpdList[0].saveimage}">
						</c:if>
						<c:if test="${list.cpdList[0].saveimage == null}">
							
							<p>아직 참가자가 없습니다!<br> 지금 참가해보세요!</p>
						</c:if>
					</div>
					<div class="text-box">
						<span class="subject">${list.subject }</span>
						<span class="content skiptext">세상에서 제일 발바닥이 까만 강아지 대회! 지금 순위를 매겨주세요!</span>
					</div>
					<div class="pet-second-third">
					<c:if test="${list.cpdList[1].saveimage != null}">
						<ul>
						
							<li>
								<div class="ts_img-box"><img src="images/${list.cpdList[1].saveimage}"></div>
								<div class="ts_text-box">
									<span class="petname">${list.cpdList[1].petname}</span>
									<span class="content skiptext">${list.cpdList[1].content}</span>
								</div>
							</li>
							<c:if test="${list.cpdList[2].saveimage != null}">
							<li>
								<div class="ts_img-box"><img src="images/pet_image2.jpg"></div>
								<div class="ts_text-box">
									<span class="petname">${list.cpdList[2].petname}</span>
									<span class="content skiptext">${list.cpdList[2].content}</span>
								</div>
							</li>
							</c:if>
						</ul>
					</c:if>
					</div>
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	<div class="button-wrap">
		<a class="moreBtn" href="zootopia.do?command=contestBoard&category=all&pagenum=1&search=">더 많은 콘테스트 보기</a>	
	</div>
</section>


<section id="populart-freeboard" class="section-common">
	<h2>최근 핫한  주제!</h2>
	<p>최근 7일간 떠오르는 자유게시판을 구경해 보세요!</p>
	<div class="communityboard">
         <ul>
            <li class="board_head">
            <span class="num">no.</span>      
            <span class="subject">[분류] 제목</span>         
            <span class="userid">닉네임 [작성자]</span>         
            <span class="createdate">작성일</span>         
            <span class="recommands">추천수</span>         
            <span class="vcount">조회수</span>         
            </li>
            <c:if test="${commList.size() == 0}"><li class="no-data">최근 추가된 내용이 없습니다....</li></c:if>
            <c:forEach var="post" items="${commList}" varStatus="state">
            <li>
               <a class="" href="zootopia.do?command=communityDetail&gseq=${post.gseq}">
               <span class="num">${state.index+1}</span>      
               <span class="subject">
                  <c:choose>
                        <c:when test="${post.kind == 1}">[고민]</c:when>
                        <c:when test="${post.kind == 2}">[자랑]</c:when>
                        <c:when test="${post.kind == 3}">[잡담]</c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                     ${post.subject}
                  </span>         
               <span class="userid">${post.nickname} [${post.userid}]</span>         
               <span class="createdate">${post.createdate}</span>         
               <span class="recommands">${post.recommands}</span>         
               <span class="vcount">${post.vcount}</span>         
            </a>
            </li>
            </c:forEach>
         </ul>
  </div>
<div class="button-wrap">
		<a class="moreBtn" href="zootopia.do?command=communityBoard">더 많은 게시글 보기</a>	
	</div>
</section>


<%@ include file ="footer.jsp" %>
<%@ include file ="css/main_css.jsp" %>