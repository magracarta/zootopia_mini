<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file ="../header.jsp" %>
<%@ include file="section/mypage_info.jsp" %>



<form class="myWriteform">
	<div class="container">
		<h2>내가 쓴 글 (${allcnt})</h2>
		<div class="communityboard">
			<div class="board_head">
	            <span class="gseq">no.</span>      
	            <span class="subject">제목</span>                
	            <span class="createdate">작성일</span>         
	            <span class="recommands">추천수</span>         
	            <span class="vcount">조회수</span>         
           </div>
         <ul>
            <c:forEach var="post" items="${communityList}" varStatus="state">
            <li>
               <a class="commudetail" href="zootopia.do?command=communityDetail&gseq=${post.gseq}">
               <c:choose>
               <c:when test="${empty communityList}">
               		<p>내가 등록한 글이 없습니다.</p>
               </c:when>
               <c:otherwise>
               <span class="gseq">no. <span class="index"></span></span>      
               <span class="subject">
                  <c:choose>
                        <c:when test="${post.kind == 1}">[고민]</c:when>
                        <c:when test="${post.kind == 2}">[자랑]</c:when>
                        <c:when test="${post.kind == 3}">[잡담]</c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                     ${post.subject}
                  </span>               
	               <span class="createdate"><fmt:formatDate value="${post.createdate}" pattern="yy/MM/dd hh:mm:ss" /></span>         
	               <span class="recommands">${post.recommands}</span>         
	               <span class="vcount">${post.vcount}</span>   
	               </c:otherwise>  
               </c:choose>    
            </a>
            </li>
            </c:forEach>
         </ul>
  	</div>

		
	<jsp:include page="writepaging.jsp" flush="true">
	  	<jsp:param name="url" value="zootopia.do?command=mywrite" />
	  	<jsp:param name="search" value="${search}" />
	</jsp:include>
		
		
		
	</div>

</form>
											
 <script>			
	let begin = ${allcnt - (paging.recordrow*(paging.currentPage-1))-1} +1;
 
	document.querySelectorAll(".communityboard li").forEach((elem,index)=>{
	 	let indexdate = begin - index;
	    elem.querySelector(".gseq .index").innerHTML = indexdate;
	  
	});
 </script>
<style>
.serach-form { display:none !important; }
</style>


<%@ include file="css/mywrite_css.jsp" %>
<%@ include file="css/mypage_css.jsp" %>
<%@ include file ="../footer.jsp" %>
