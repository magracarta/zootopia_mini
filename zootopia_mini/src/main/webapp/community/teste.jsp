<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>


<div class="reply">
	 <c:if test="${loginUser.userid == reply.userid}">         
		<div class="submit_reply">
			<form method="post" action="zootopia.do?command=writeCommunityReply" name="commentwrite" >
				<input type="hidden" name="userid" value="${loginUser.userid}">
				<input type="hidden" name="gseq" value="${communityVO.gseq}">
				<div class="longin-info-box">
					 <c:if test="${not empty reply.saveImage}">
	                     <img src="images/${reply.saveImage}">
	                </c:if>
	                <span>${reply.nickname}[${reply.userid}]</span>
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
								
								
							<div class="text-box">
								<span>@ ${replylist.mvo.nickname }</span>
								<span>${replylist.content }</span>
							</div>
							<div class="button-box">
								<p>${replylist.createdate}</p>
							</div>
							
							
						
						</div>
						<c:if test="${loginUser.userid == replylist.userid}">
								<div class="replyUpdateForm">
									<form action="zootopia.do?" name="replyupdateform">
										<input type="hidden" name="command" value="contestUpdateReply">
										<input type="hidden" name="userid" value="${replylist.userid}">
										<input type="hidden" name="cseq" value="${replylist.cseq}">
										<input type="hidden" name="index" value="${index}">
										<input type="hidden" name="pagenum" value="${pagenum}">
										<input type="hidden" name="crseq" value="${replylist.crseq}">
										<textarea name="content"></textarea>
										<div class="button_box">
											<input type="submit" value="수정" onclick="return replyUpdate(${state.index})">
											<input class="delete" type="button" value="삭제" onclick="replyDelete('${replylist.crseq}' , '${replylist.cseq}' , '${index}' , '${pagenum}')">
										</div>
									</form>
								</div>
						</c:if>
					</li>		
				</c:forEach>