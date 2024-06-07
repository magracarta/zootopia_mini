<%@  page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>


<div class="contest">
	

<div class="title-wrapper">
	<h2 class="title">${title} (${Allcount})</h2>
</div>
<div class="contest-category" data-category="">
	<ul data-category ="${category}">
		<li><a class="all" href="zootopia.do?command=admincontestlist&category=all&pagenum=1&search=">모든 콘테스트</a></li>
		<li><a class="playing" href="zootopia.do?command=admincontestlist&category=playing&pagenum=1&search=">진행중인 콘테스트</a></li>
		<li><a class="completed" href="zootopia.do?command=admincontestlist&category=completed&pagenum=1&search=">완료된 콘테스트</a></li>
		<li><a class="waiting" href="zootopia.do?command=admincontestlist&category=waiting&pagenum=1&search=">대기중인 콘테스트</a></li>
		<li><a class="rejected" href="zootopia.do?command=admincontestlist&category=rejected&pagenum=1&search=">거절된 콘테스트</a></li>
	</ul>
</div>
<style>


</style>
 

<div class="contest_container">
<form>
	<div class="button-container">
		<div class="allcheckbox">
			<input type="checkbox" name="allcheck" id="allcheck">
			<label for="allcheck">모두 선택</label>
		</div>
		<div class="button-box">
		<input type="button" value="삭제">
		<input type="button" value="수락">
		<input type="button" value="거절">
		</div>
	</div>
	<div class="contest_list">
		<ul>
			<c:forEach items ="${contestDtoList}" var="list" varStatus="state">
			<c:choose>
				<c:when test="${list.useyn == 'W'}">
					<li class="wating">
				</c:when>
				<c:when test="${list.useyn == 'N'}">
					<li class="rejected">
				</c:when>
				<c:when test="${list.lastdate < now}">
					<li class="end">
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
		
						<c:if test="${list.useyn == 'W'}">
								<p class="wating">대기 중</p>
						</c:if>
						<div class="date_num">
							<div class="left">
							<input type="checkbox" name="cseq" value="${list.cseq}">
							 <span class="cseq">게시판 번호 : ${list.cseq} / <span style="margin:5px 0 10px;">게시자 - ${list.userid}</span>
							</span>
							</div>
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
							<p class="complete">참가현황 (${list.cpdList.size()}/${list.pcnt })</p>
							
							<c:if test="${list.lastdate < now}">
								<span>마감기한이 지났습니다. <br>${list.lastdate}</span>
							</c:if>
							
							
							<a class='go_btn' data-url ="${list.cseq}">수정하기</a>
							
						</div>	
						</div>		
					
				</li>
			</c:forEach>
			
		</ul>
		
	</div>

</form>
	<jsp:include page="/admin/contest/paging.jsp" flush="true" >
		<jsp:param name="url" value="zootopia.do?command=admincontestlist" />
		<jsp:param name="search" value="${search}" />
	</jsp:include>

</div>
</div>

 <script>
 let category =location.href.split("category=")[1].split("&")[0];
 document.querySelector("."+category).classList.add("select");
   setTimeout(()=>{
	   var swiper = new Swiper(".mySwiper", {
		   slidesPerView: 'auto',
		      freeMode: true,
		    });
   document.querySelector('input[name="allcheck"]').addEventListener('change',(e)=>{
	        document.querySelectorAll('input[name="cseq"]').forEach((elem)=>{
			    if(e.target.checked == true) elem.checked = true;
		    	else elem.checked = false;
	        });
	});
   },500);
 </script>
<%@ include file="/admin/footer.jsp" %>
<%@ include file="/admin/contest/css/admincontest_css.jsp" %>
