<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zootopia_mini.zootopia.controller.dto.CommunityVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<section >

		<div class="header">
			<div class="text">
				<div class="num">no.${communityVO.gseq}</div>      
			    <div class="top">
				    <div class="title">
			    	<c:choose>
	                    <c:when test="${communityVO.kind == 1}">[고민]</c:when>
	                    <c:when test="${communityVO.kind == 2}">[자랑]</c:when>
	                    <c:when test="${communityVO.kind == 3}">[잡담]</c:when>
	                    <c:otherwise></c:otherwise>
	                </c:choose>
	                ${communityVO.subject}
	                </div>
	                <div class="namerecomreply">
	                	<c:if test="${not empty communityVO.saveImage}">
                    		<div class="image_box">           
                        		<img src="images/${communityVO.saveImage}">
                  		 	</div>
               			</c:if>
               			<c:if test="${empty communityVO.saveImage}">
                    		<div class="image_box">           
                        		<img src="images/repl-noimg.png">
                  		 	</div>
               			</c:if>
	                	<div class="nickname">${communityVO.nickname}[${communityVO.userid}]</div>
	                	<div class="recommandWrap">추천 수[${communityVO.recommands}]</div>
	                	<div class="vcount">조회수:${communityVO.vcount}</div>
	                </div>
			    </div>
			</div>
			<div class="buttondiv">
				<c:if test="${not empty loginUser.userid}">
		  		  <c:choose>
		  	     	 <c:when test="${communityVO.userid == loginUser.userid}">
		          		  <div class="button_container">
			                <input class="button1" type="button" value="수정" onclick="location.href='zootopia.do?command=communityUpdateForm&gseq=${communityVO.gseq}'">    
			                <input class="button2" type="button" value="삭제" onclick="deleteCommunity('${communityVO.gseq}')">
		           		 </div>
		        	</c:when>
		   		 </c:choose>
				</c:if>
			</div>
		</div>
		<div class="detailcontainer">
			<div class="content" >
				<pre>${communityVO.content}</pre> 
				
				<div class="buttonWrap">
					<button class="recommendButton button3" data-gesq = "${communityVO.gseq}" >추천</button>
					<input class="button3" type="button" value="목록으로" onclick="location.href='zootopia.do?command=communityBoard'">
				</div>
			</div>
        </div>
		
  <div class="comment-section">
        <h2 class="comment2">댓글 ${replyAllcount}개</h2>
        <form class="commentwrite" action="zootopia.do?command=writeCommunityReply" method="post">
            <textarea class="write" name="content" required></textarea>
            <input type="hidden" name="gseq" value="${communityVO.gseq}">
            <button class="submit" type="submit">작성하기</button>
        </form>

        <div class="reply_list ">
            <ul>
                <c:forEach var="reply" items="${communityReplies}">
                <li>
                    <div class="top">
							<div class="image_box">
								<c:if test ="${reply.saveImage != null}">
									<img src="images/${reply.saveImage}">
								</c:if>
								<c:if test ="${reply.saveImage == null}">
									<img src="images/repl-noimg.png">
								</c:if>
							</div>
								
							<div class="text-box">
								<span>@ ${reply.nickname }</span>
								<pre>${reply.content }</pre>
							</div>
							<div class="button-box">
								<p>${reply.createdate}</p>
							</div>
					</div>
                        <c:if test="${loginUser.userid == reply.userid}">  
                          <div class="replyUpdateForm">
                            <form action="zootopia.do?command=updateCommunityReply" method="post">
                                <input type="hidden" name="grseq" value="${reply.grseq}">
                                <input type="hidden" name="gseq" value="${communityVO.gseq}">
                                <textarea name="content" id="edit-content-${reply.grseq}"></textarea>
                                <div class="button_box">
	                                <input class="fin" type="submit" value="수정 완료">
	                            	<input class="delete" type="button" value="삭제" onclick="deleteCommunityReply('${reply.grseq}', '${communityVO.gseq}')">
                            	</div>
                            </form> 
                          </div>
                        </c:if>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    
</section>

<%@ include file="/community/css/community_css.jsp" %>
<%@ include file="/footer.jsp" %>

