<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/header.jsp" %>
<%@ include file ="css/content_css.jsp" %>


<div class="contest contest_detail">
	<div class="title-wrapper">
		<div  class="left">
			<%-- <span class="detail_num">NO. ${contest_detail.cseq}</span> --%>
			<span class="detail_num">NO. ${index}</span>
			<span class="detailinfo">작성자 : ${contest_detail.nickname} / 조회수 : ${contest_detail.cnt}</span>
			<h2 class="title">${contest_detail.subject}</h2>
			<p>${contest_detail.content}</p>
		</div>
		<div class="right">
			<c:if test="${contest_detail.lastdate > now}">
				<span class="lastdate" style="display:block; color:#FF4646; text-align:right;"><fmt:formatDate value="${contest_detail.lastdate}" pattern="yy/MM/dd hh:mm:ss" />까지 등록가능</span>
				<c:if test="${contest_detail.userid == loginUser.userid  }">
					<a style="margin-top:15px;" href="zootopia.do?command=contestUpdateForm&cseq=${contest_detail.cseq}">콘테스트 수정하기</a>
				</c:if>
			</c:if>
			<c:if test="${contest_detail.lastdate < now}">완료된 콘테스트</c:if>
			<c:if test="${contest_detail.userid == loginUser.userid  }">
				<a style="margin-top:15px; margin-left:10px; background:#000; color:#fff;" href="#none" onclick="goDelete('${contest_detail.cseq}')">콘테스트 삭제하기</a>
			</c:if>
		</div>
	</div>
	<div class="contest_pet_list">
		<ul>
			<c:forEach items ="${contest_detail.cpdList}" var="plist" varStatus="state" >
				 <li>
				 	<div class="image-box">
				 		<img src="images/${plist.image}">
					 	<div class="rank">
					 		${state.index+1}위
					 	</div>
					 	<div class="text-box">
					 		<div class="kind_recommend">
					 			<span class="tag">추천 : ${plist.recommends}</span>
					 			<span>${plist.kind}</span>
					 		</div>
					 		<div class="content_box">
					 			<span class="name">이름 : ${plist.petname}</span>
				 				<c:if test = '${plist.petgender == "F"}'>
				 					<span class="gender wemen">♀</span>
				 				</c:if>
					 			<c:if test = '${plist.petgender == "M"}'>
			 						<span class="gender men">♂</span>
				 				</c:if>
				 				<p class="content">
				 					${plist.content}
				 				</p>
					 		</div>
					 		<a class="recommnadButton" href="zootopia.do?command=reccomnad&cpseq=${plist.cpseq}">추천하기</a>
					 	</div>
				 	</div>
				</li>
			</c:forEach>
			<c:if test='${contest_detail.cpdList.size() <  contest_detail.pcnt}'>
				<li class="more_pet">
					<a href="javascript:0">
						<span class="plus"><img src="images/plus.png"></span>
						<span class="button">더 추가하기</span>
					</a>
				</li>
			</c:if>
		</ul>
	</div>


	<div class="reply">
		<h2>댓글 33개</h2>
		<c:if test="${loginUser == null}">
		<div class="submit_reply">
			<form>
				<div class="longin-info-box">
					<img src="images/repl-noimg.png">
					<span>${loginUser.nickname} 님</span>
				</div>
				<input type="text" name="reply">
				<input type="submit" onclick="return contest_reply()" value ="등록">
			</form>
		</div>
		</c:if>
	</div>


</div>
<%@ include file ="/footer.jsp" %>

<script src="contest/script/contestForm.js"></script>


<div class="">
	<form name="">
	
	</form>
</div>

<script>
	
	if(location.href.indexOf("delete=no") > 0){
		alert("삭제에 실패했습니다.");
		location.href="zootopia.do?command=contestDetail&cseq="+${contest_detail.cseq};
	}
	
</script>