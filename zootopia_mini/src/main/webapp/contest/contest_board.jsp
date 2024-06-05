<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.Timestamp, java.util.Date" %>
<%@ include file ="/header.jsp" %>
<%@ include file ="css/content_css.jsp" %>

<script>
	if(location.href.indexOf("contestDelete") > 0){
		alert("삭제에 성공했습니다.");
		location.href="zootopia.do?command=contestBoard";	
	}
</script>

<div class="contest">

<div class="title-wrapper">
	<h2 class="title">콘테스트 (${allcnt})</h2>
	<a href="zootopia.do?command=contestForm">나도 콘테스트 추가하기 ></a>
</div>
<div class="contest-category">
	<ul data-category ="${category}">
		<li><a class="all" href="zootopia.do?command=contestBoard&category=all&pagenum=1&search=">All</a></li>
		<li><a class="playing" href="zootopia.do?command=contestBoard&category=playing&pagenum=1&search=">진행중인 콘테스트</a></li>
		<li><a class="accomplished" href="zootopia.do?command=contestBoard&category=accomplished&pagenum=1&search=">완료된 콘테스트</a></li>
		<li><a class="wating" href="zootopia.do?command=contestBoard&category=wating&pagenum=1&search=">대기중인 콘테스트</a></li>
	</ul>
</div>

<script>
let category = document.querySelector(".contest-category ul").dataset.category;
document.querySelector("."+category).classList.add("select");
</script>
 
<div class="contest_container">
	<div class="contest_list">
		<ul>
			<c:forEach items ="${contestList}" var="list" varStatus="state">
				<li>
						<div class="date_num">
							<%-- <span class="cseq">NO. ${list.cseq} <br> --%>
							<span class="cseq">NO. <span class="index"></span> <br>
								<span style="font-size:14px; display:block; margin:5px 0 10px;">개최자 - ${list.nickname}</span>
							</span>
								<div class="left-box">
									<p>조회수(${list.cnt})</p>
								<c:if test="${list.lastdate > now}">
									<span class="lastdate"><fmt:formatDate value="${list.lastdate}" pattern="yy/MM/dd hh:mm:ss" />까지 등록가능</span>
								</c:if>
							
								</div>
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
										 	<img src="images/${plist.saveimage}">
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
							<c:if test="${list.useyn == 'W'}">
								<a class="go_btn watingText">대기 중</a>
							</c:if>
							<c:if test="${list.useyn != 'W'}">
								<a class='go_btn' data-url ="${list.cseq}">
									자세히 보러가기
								</a>
							</c:if>
						</div>	
						</div>		
					
				</li>
			</c:forEach>
			
		</ul>
	</div>

	<jsp:include page="/paging/paging.jsp" flush="true" >
		<jsp:param name="url" value="zootopia.do?command=contestBoard" />
		<jsp:param name="search" value="${search}" />
	</jsp:include>

</div>
</div>

 <script>
 
   var swiper = new Swiper(".mySwiper", {
	   slidesPerView: 'auto',
	      freeMode: true,
	    });
   
   

 let begin = ${allcnt - (paging.recordrow*(paging.currentPage-1))-1} +1;
 
 document.querySelectorAll(".contest_list li").forEach((elem,index)=>{
	 	let indexdate = begin - index;
	    elem.querySelector(".date_num .index").innerHTML = indexdate;
	    elem.querySelector(".go_btn").href="zootopia.do?command=contestcount&cseq="+elem.querySelector(".go_btn").dataset.url+"&index="+indexdate
	    		+"&contestDetailCount=1";
	});
 </script>
 
 

<%@ include file ="/footer.jsp" %>