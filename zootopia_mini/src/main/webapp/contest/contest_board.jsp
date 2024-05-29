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
					<a href="zootopia.do?command=contestDetail&cseq=${list.cseq}">
						<div class="date_num">
							<span class="cseq">${list.cseq}</span>
							<c:if test="${list.lastdate > now}">
								<span class="lastdate"><fmt:formatDate value="${list.lastdate}" pattern="yy/MM/dd hh:mm:ss" />까지 등록가능</span>
							</c:if>
						</div>
						<div class="title-box">
							<h1>${list.subject}</h1>
							<p>${list.content}</p>
						</div>
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
										
					</a>
				</li>
			</c:forEach>
			
		</ul>
		
	</div>

</div>
</div>

 <script>
 
   var swiper = new Swiper(".mySwiper", {
	   slidesPerView: 'auto',
	      freeMode: true,
	    });
 </script>

<%@ include file ="/footer.jsp" %>