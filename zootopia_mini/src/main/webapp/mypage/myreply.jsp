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
                <c:choose>
                    <c:when test="${myReplyList.size() == 0}">
                        <p>등록된 댓글이 없습니다!</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${myReplyList}" var="list" varStatus="loop">
                            <li class="comment-item">
                                <c:if test="${loop.index >= paging.firstnum - 1 && loop.index < paging.lastnum}">
                                    <span class="comment-number">no.${loop.index + 1}</span> 
                                    <div class="comment-content">
                                        <p class="userid">
                                            <c:out value="${list.userId}"/> 
                                            <span class="replyDate">
                                                <c:out value="${list.replyDate}" />
                                            </span>
                                        </p>
                                        <p>
                                            <c:out value="${list.replyContent}" />
                                        </p>
                                        <p>
                                            원문제목 : <span class="subject"><c:out value="${list.subject}"/></span>
                                        </p>
                                    </div>
                                    <div class="comment-actions">
                                        <c:choose>
                                            <c:when test="${list.type == 'community'}">
                                                <button type="button" onclick="location.href='zootopia.do?command=communitydetail&gseq=${list.postId}'">글 보러가기</button>
                                            </c:when>
                                            <c:when test="${list.type == 'contest'}">
                                                <button type="button" onclick="location.href='zootopia.do?command=contestdetail&cseq=${list.postId}'">글 보러가기</button>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </c:if>
                            </li>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

        <!-- 페이지네이션 include -->
        <jsp:include page="replypaging.jsp" flush="true">
            <jsp:param name="url" value="zootopia.do?command=myreply" />
            <jsp:param name="search" value="${searchResult}" />
        </jsp:include> 
        
    
    <c:if test="${currentPage < totalPages}">
        <a href="zootopia.do?command=myreply&pagenum=${currentPage + 1}">다음</a>
    </c:if>
</div>
    </div>
</form>

<%@ include file="css/myreply_css.jsp" %>
<%@ include file="css/mypage_css.jsp" %>
<%@ include file="../footer.jsp" %>
