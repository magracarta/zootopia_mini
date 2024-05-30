<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp, java.util.Date" %>
<%@ include file ="/header.jsp" %>
<%@ include file ="css/content_css.jsp" %>

<div class="contest">

<div class="title-wrapper">
	<h2 class="title">콘테스트 (${allcnt})</h2>
	<a href="zootopia.do?command=contestForm">나도 콘테스트 추가하기 ></a>
</div>


<div class="contest_container">
	<div class="contest_list">
		<ul>
			<c:forEach items ="${contestList}" var="list" varStatus="state" >
				<li>
						<div class="date_num">
							<span class="cseq">NO. ${list.cseq}</span>
							<c:if test="${list.lastdate > now}">
								<div class="left-box">
								<p>조회수(${list.cnt})</p>
								<span class="lastdate"><fmt:formatDate value="${list.lastdate}" pattern="yy/MM/dd hh:mm:ss" />까지 등록가능</span>
							
								</div>
							</c:if>
						</div>
						<div class="title-box">
							<h1>${list.subject}</h1>
							<p>${list.content}</p>
						</div>
						<div class="bottom-wrap">
						<div class="listcpist">
						<c:choose>
							<c:when test="${list.cpdList.size() > 0}">
						 	<div class="swiper mySwiper">
							    <div class="swiper-wrapper">
									<c:forEach items ="${list.cpdList}" var="plist" varStatus="state" >
										 <div class="swiper-slide">
										 	<img src="images/${plist.image}">
										 	<div class="rank">
										 		${state.index+1}
										 	</div>
									 	</div>
									</c:forEach>
								 </div>
							</div>
							</c:when>
							<c:otherwise>
								<div class="no_pet">
									아직 참가한 애완동물이 없습니다! 지금 참가해주세요!
								</div>
							</c:otherwise>
						</c:choose>
						
						</div>
						<div class="button-wrapper">
						<c:if test="${list.lastdate > now}">
							<c:choose>
								<c:when test = "${list.pcnt > list.cpdList.size()}">
									<p>${list.pcnt - list.cpdList.size()}마리 더 도전할수 있어요!</p>
								</c:when>
								<c:otherwise>
									<p class="complete">${list.pcnt}마리 모두 도전 완료!</p>
								</c:otherwise>
							</c:choose>
							
							</c:if>
							<c:if test="${list.lastdate < now}">
								<span>투표기간이 완료되었습니다.<br>결과를 같이 확인해주세요!</span>
							</c:if>
							<a href="zootopia.do?command=contestDetail&cseq=${list.cseq}">
							자세히 보러가기
							</a>
						</div>	
						</div>		
					
				</li>
			</c:forEach>
			
		</ul>
	</div>
	
	<!-- 페이지네이션, 검색 -->
	<div class="pagenation-container">
		<c:if test="${paging.prev == true}">
		<a class="prevBtn" href="zootopia.do?command=contestBoard&pagenum=${paging.firstnum-paging.pagecnt}"><img src="images/arrow.svg"></a>
		</c:if>
		<div class="pagenation-wrapper">
			<c:forEach begin="${paging.firstnum}" end="${paging.lastnum}" var="idx" varStatus="state">
			<c:choose>
				<c:when test="${idx == paging.currentPage}">
					<span>${idx}</span>
				</c:when>
				<c:otherwise>
					<a href="zootopia.do?command=contestBoard&pagenum=${idx}">${idx}</a>
				</c:otherwise>
			</c:choose>
			
			</c:forEach>
		</div>
		<c:if test="${paging.next == true}">
		<a  class="nextBtn"  href="zootopia.do?command=contestBoard&pagenum=${paging.lastnum+1}"><img src="images/arrow.svg"></a>
		</c:if>
	</div>
	
	<style>
		.pagenation-container { display:flex; align-items: center; justify-content: center; }
		.pagenation-container .nextBtn,
		.pagenation-container .prevBtn { width:9px; position:relative; top:3px; margin:0 10px; }
		.pagenation-container .prevBtn img { transform: rotate(-180deg); }
		.pagenation-container img {width:100%;  }
		.pagenation-container .pagenation-wrapper {   display: flex; font-size: 15px; }
		.pagenation-container .pagenation-wrapper * { width: 25px; height: 25px; display: flex; justify-content: center;
    			align-items: center; color:#999999; border-radius:3px;  }
		.pagenation-container .pagenation-wrapper span { background:#1F1F1F; color:#fff;  }
	
	</style>

</div>
</div>

 <script>
 
   var swiper = new Swiper(".mySwiper", {
	   slidesPerView: 'auto',
	      freeMode: true,
	    });
 </script>

<%@ include file ="/footer.jsp" %>