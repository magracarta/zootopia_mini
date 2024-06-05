<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file ="../header.jsp" %>
<%@ include file="section/mypage_info.jsp" %>


<form class="myReplyform">
	<div class="container">
        <h2>내가 쓴 댓글 (<c:out value="${myReplyList.size()}" />)</h2>
        <div class="comments-container">
        <ul class="comment-list">
        	
             <c:forEach items="${myReplyList}" var="list" varStatus="loop">
             <c:choose>
        		<c:when test="${myReplyList.size() == 0}">
        			등록된 댓글이 없습니다!
        		</c:when>
        		<c:otherwise>
                    <li class="comment-item">
                        <span class="comment-number">no.${post.gseq}</span> 
                        <div class="comment-content">
                            <p class="userid"><c:out value="${list.userId}"/> 
                            	<span class="replyDate"><c:out value="${list.replyDate}" /></span>
                            </p>
                            <p>
	                            <c:out value="${list.replyContent}" />
                            </p>
                            <p>
                            
                            원문제목 : <span class="subject"><c:out value="${list.subject}"/></span>
                            
                            </p>
                            
                        </div>
                        <div class="comment-actions">
                            
                            <button>글 보러가기</button>
                        </div>
                    </li>
                 </c:otherwise>
			</c:choose>
             </c:forEach>
             
        </ul>
        </div>

		
	<jsp:include page="replypaging.jsp" flush="true">
	  	<jsp:param name="url" value="zootopia.do?command=myreply" />
	  	<jsp:param name="search" value="${searchResult}" />
	</jsp:include>
		
		
		
	</div>

</form>


<%@ include file="css/myreply_css.jsp" %>
<%@ include file="css/mypage_css.jsp" %>
<%@ include file ="../footer.jsp" %>