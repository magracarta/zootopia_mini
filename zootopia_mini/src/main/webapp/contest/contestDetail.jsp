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
				
				<span class="lastdate" style="display:block; color:#FF4646; margin-bottom:10px; text-align:right;"><fmt:formatDate value="${contest_detail.lastdate}" pattern="yy/MM/dd hh:mm:ss" />까지 등록가능</span>
				
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
		<div class="contestpetInfo_container">
			<div class="contestpetInfo">
				참가 현황 - (${contest_detail.cpdList.size()}/${contest_detail.pcnt})
			</div>
		</div>
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
					 		<c:if test="${contest_detail.lastdate > now}">
						 		<a class="recommnadButton"
					 		 href="zootopia.do?command=reccomnadPet&cpseq=${plist.cpseq}&cseq=${contest_detail.cseq}&index=${index}">추천하기</a>					 		
					 		
					 		 <c:if test ="${plist.userid == loginUser.userid}">
					 		 	<div class="loginButton_ud">
					 		 	<a class="petUpdate" href="javascript:0" 
					 		 	data-cpseq="${plist.cpseq}" data-content="${plist.content}"
					 		 	data-img = "${plist.saveimage }" data-cpseq="${plist.cpseq}"
					 		 	  >펫 정보 수정하기</a>
					 		 	<a class="petDelete" href="javascript:0" data-cpseq="${plist.cpseq}"
					 		 		data-index="${index}" data-cseq="${contest_detail.cseq}"
					 		 	>삭제하기</a>
					 		 	</div>
					 		 </c:if>
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
						<a href="zootopia.do?command=loginform">
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
		<h2>댓글 ${replyAll}개</h2>
		<c:if test="${loginUser != null}">
		<div class="submit_reply">
			<form method="post" action="zootopia.do?command=updateReply" name="replyform" >
				<input type="hidden" name="userid" value="${replylist.userid}">
				<input type="hidden" name="cseq" value="${replylist.cseq}">
				<input type="hidden" name="index" value="${index}">
				<input type="hidden" name="crseq" value="${replylist.crseq}">
				<div class="longin-info-box">
					<c:if test ="${loginUser.saveimage != null}">
						<img src="images/${loginUser.saveimage}">
					</c:if>
					<c:if test ="${loginUser.saveimage == null}">
						<img src="images/repl-noimg.png">
					</c:if>
					<span>@ ${loginUser.nickname}</span>
				</div>
				<div class="login-content">
					<textarea name="content"></textarea>
					<div><input type="submit" onclick="return contest_reply()" value ="등록"></div>
				</div>
			</form>
		</div>
		</c:if>
		<div class="reply_list">
			<ul>
				<c:forEach items="${creplylist}" var ="replylist" varStatus="state">
					<li>
						<div class="top">
							<div class="image_box">
								<c:if test ="${replylist.mvo.saveimage != null}">
									<img src="images/${replylist.mvo.saveimage}">
								</c:if>
								<c:if test ="${replylist.mvo.saveimage == null}">
									<img src="images/repl-noimg.png">
								</c:if>
								
							</div>
							<div class="text-box">
								<span>@ ${replylist.userid }</span>
								<span>${replylist.content }</span>
							</div>
							<div class="button-box">
						
								<p>${replylist.createdate}</p>
							</div>
							
							
						
						</div>
						<c:if test="${loginUser.userid == replylist.userid}">
								<div class="replyUpdateForm">
									<form action="zootopia.do?command=updateReply" name="replyform">
										<input type="hidden" name="userid" value="${replylist.userid}">
										<input type="hidden" name="cseq" value="${replylist.cseq}">
										<input type="hidden" name="index" value="${index}">
										<input type="hidden" name="crseq" value="${replylist.crseq}">
										<textarea name="content"></textarea>
										<div class="button_box">
											<input type="submit" value="수정">
											<input class="delete" type="button" value="삭제" onclick="">
										</div>
									</form>
								</div>
						</c:if>
					</li>		
				</c:forEach>
				
				<jsp:include page="/paging/paging.jsp" flush="true" >
					<jsp:param name="url" value="zootopia.do?command=contestDetail&cseq=${contest_detail.cseq}&index=${index}" />
					<jsp:param name="search" value="${search}" />
				</jsp:include>
			</ul>
		</div>
	</div>


</div>
<%@ include file ="/footer.jsp" %>
<style>

</style>


<!-- 콘테스트 펫 생성폼 -->
<jsp:include page="/contest/contestaddform.jsp" flush="true" >
	<jsp:param name="command" value="insertContestPet" />
	<jsp:param name="className" value="createForm_contaienr" />
</jsp:include>
<!-- 콘테스트 펫 수정폼 -->
<jsp:include page="/contest/contestUpdatepetform.jsp" flush="true" >
	<jsp:param name="command" value="updateContestPet" />
	<jsp:param name="className" value="updateForm_contaienr" />
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
	location.href="zootopia.do?command=loginform";
	</script>
</c:if>