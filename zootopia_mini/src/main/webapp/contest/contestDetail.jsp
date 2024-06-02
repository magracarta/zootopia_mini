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
		<div class="right" style="text-align: right;">
			<c:if test="${contest_detail.lastdate > now}">
				
				<span class="lastdate" style="display:block; color:#FF4646; text-align:right;"><fmt:formatDate value="${contest_detail.lastdate}" pattern="yy/MM/dd hh:mm:ss" />까지 등록가능</span>
				
				<c:if test="${contest_detail.userid == loginUser.userid  }">
					<a style="margin:15px 0;" href="zootopia.do?command=contestUpdateForm&cseq=${contest_detail.cseq}">콘테스트 수정하기</a>
				</c:if>
			</c:if>
			<c:if test="${contest_detail.lastdate < now}">완료된 콘테스트</c:if>
			<c:if test="${contest_detail.userid == loginUser.userid  }">
				<a style="margin:15px 0; margin-left:10px; background:#000; color:#fff;" href="#none" onclick="goDelete('${contest_detail.cseq}')">콘테스트 삭제하기</a>
				<br>
			</c:if>
			<a style="margin-bottom:15px; margin-left:10px;" href="zootopia.do?command=contestBoard">뒤로가기 ></a>
		</div>
	</div>
	<div class="contest_pet_list">
		<ul>
			<c:forEach items ="${contest_detail.cpdList}" var="plist" varStatus="state" >
				 <li>
				 	<div class="image-box">
				 		<img src="images/${plist.saveimage}">
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
					 		<a class="recommnadButton"
					 		 href="zootopia.do?command=reccomnadPet&cpseq=${plist.cpseq}&cseq=${contest_detail.cseq}&index=${index}">추천하기</a>
					 		 <c:if test ="${plist.userid == loginUser.userid}">
					 		 	<div class="loginButton_ud">
					 		 	<a class="petUpdate" href="">펫 정보 수정하기</a>
					 		 	<a class="petDelete" href="">삭제하기</a>
					 		 	</div>
					 		 </c:if>
					 	</div>
				 	</div>
				</li>
			</c:forEach>
			<c:if test='${contest_detail.cpdList.size() <  contest_detail.pcnt}'>
			<c:choose>
				<c:when test="${loginUser.petname != null }">
					<li class="more_pet">
						<a href="javascript:0" class="morePetBtn" >
							<span class="plus"><img src="images/plus.png"></span>
							<span class="button">더 추가하기</span>
						</a>
					</li>
				</c:when>
				<c:when test="${empty loginUser}">
					<li class="more_pet">
						<a href="zootopia.do?command=loginForm">
							<span style="color:#fff">로그인 먼저 해주세요.</span>
							<span class="button">로그인하러가기</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="more_pet">
						<a href="zootopia.do?command=mypage">
							<span style="color:#fff">등록된 애완동물이 없습니다.</span>
							<span class="button">애완동물을 추가하러가기</span>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
				
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
<style>
.loginButton_ud { margin-top:10px; display: flex; text-align: center; }
.petUpdate , .petDelete { font-size:15px; color:#fff; background:#000; border:1px solid #000; border-radius:5px; padding:15px 0; }
.petDelete { color:#000; background:#fff; margin-left:10px; }
</style>


<jsp:include page="/contest/contestaddUpdatepetform.jsp" flush="true" >
		<jsp:param name="command" value="insertContestPet" />
		<jsp:param name="className" value="createForm_contaienr" />
	
	</jsp:include>

<script src="contest/script/contestForm.js"></script>



<script>
	function alertandlocation(text,cseq){
		alert(text);
		location.href="zootopia.do?command=contestDetail&cseq="+cseq+"&index="+${index};
	}
	if(location.href.indexOf("delete=no") > 0)	alertandlocation("삭제에 실패했습니다.",${contest_detail.cseq});

</script>


<c:if test ="${areadyexist == 1 }">
	<script>
	alertandlocation("이미 참가한 콘테스트입니다.",${cseq});
	</script>
</c:if>
<c:if test ="${areadyexist == 2 }">
	<script>
	alertandlocation("아쉽게도 참가자리가 모두 가득찼습니다.",${cseq});
	</script>
</c:if>
<c:if test ="${user == 'no' }">
	<script>
	alert("로그인 후 추천해주세요.");
	location.href="zootopia.do?command=loginForm";
	</script>
</c:if>