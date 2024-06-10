<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file ="../header.jsp" %>
<%@ include file="section/mypage_info.jsp" %>

<form class="myReplyform">
    <div class="myreply-container">
		<div class="column">
			<h2>콘테스트 댓글(${myContestReplyCount})</h2>
				<div class="myreplylist">
					<c:choose>
            			<c:when test="${empty myCntReplyList}">
                			<p>내가 등록한 댓글이 없습니다.</p>
            			</c:when>
            			<c:otherwise>
            				<div class="scroll">
            					<c:forEach items ="${myCntReplyList}" var="list">
			                		<div class="myreply-content">
										<a href="zootopia.do?command=contestDetail&cseq=${list.cseq}">
				                    		<h3>${list.content}</h3>
				                    		<p><fmt:formatDate value="${list.createdate}" pattern="yy/MM/dd hh:mm:ss" /></p>
		                    			</a>
	                				</div>
	                			</c:forEach>
			                </div>
            			</c:otherwise>
        			</c:choose>
				</div>
			</div>
			<div class="column">
			<h2>자유게시판 댓글(${myCommunityReplyCount})</h2>
				<div class="myreplylist">
					<c:choose>
						<c:when test="${empty myComReplyList}">
							 <p>내가 등록한 댓글이 없습니다.</p>
						</c:when>
					<c:otherwise>
		                	<div class="scroll">
            					<c:forEach items ="${myComReplyList}" var="list2">
			                		<div class="myreply-content">
										<a href="zootopia.do?command=communityDetail&gseq=${list2.gseq}">
				                    		<h3>${list2.content}</h3>
				                    		<p><fmt:formatDate value="${list2.createdate}" pattern="yy/MM/dd hh:mm:ss" /></p>
		                    			</a>
	                				</div>
	                			</c:forEach>
			                </div>
            			</c:otherwise>
					</c:choose>
				</div>
			</div>
		
	</div>
</form>

<%@ include file="css/myreply_css.jsp" %>
<%@ include file="css/mypage_css.jsp" %>
<%@ include file="../footer.jsp" %>
