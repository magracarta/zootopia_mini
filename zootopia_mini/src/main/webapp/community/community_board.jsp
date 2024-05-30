<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file ="/header.jsp" %>
<form method="post" name="frm">
   <div class="tb">
      <div class="row">
         <div class="coltitle" style="flex:1">번호(답변여부)</div>
         <div class="coltitle" style="flex:3">제목</div>
         <div class="coltitle" style="flex:1">작성자</div>
         <div class="coltitle" style="flex:1">작성일</div>
      </div>   
      <c:forEach items="${communityboard}" var="CommunityVO">
         <div class="row">
            <div class="col" style="flex:1">
               ${CommunityVO.qseq}
               <c:choose>
                     <c:when test='${empty CommunityVO.reply}'>(미처리)</c:when>
                    <c:otherwise>(답변완료)</c:otherwise>
                </c:choose>
            </div>            
            <div class="col" style="flex:3">
            <a href="zootopia.do?command=communityDetail&gseq=${CommunityVO.gseq}">
            ${CommunityVO.subject}
            </a>
            </div>
            <div class="col" style="flex:1">${CommunityVO.userid}</div>
            <div class="col" style="flex:1"><fmt:formatDate value="${CommunityVO.indate}" /></div>
         </div>   
      </c:forEach>
    
   </div>
   
<form>
</article>

 <%@ include file ="/footer.jsp" %>
