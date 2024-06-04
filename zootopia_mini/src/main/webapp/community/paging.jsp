<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 페이지네이션, 검색 -->
<% String url = request.getParameter("url");
   String search = request.getParameter("search");
%>
	<div class="pagenation-container">
		<c:if test="${paging.prev == true &&  paging.pageAllcount > paging.pagecnt }">
		<a class="prevBtn" href="<%=url%>&pagenum=${paging.firstnum-paging.pagecnt}"><img src="images/arrow.svg"></a>
		</c:if>
		<div class="pagenation-wrapper">
			<c:forEach begin="${paging.firstnum}" end="${paging.lastnum}" var="idx" varStatus="state">
			<c:choose>
				<c:when test="${idx == paging.currentPage}">
					<span>${idx}</span>
				</c:when>
				<c:otherwise>
					<a href="<%=url%>&pagenum=${idx}">${idx}</a>
				</c:otherwise>
			</c:choose>
			
			</c:forEach>
		</div>
		<c:if test="${paging.next == true}">
		<a  class="nextBtn"  href="<%=url%>&pagenum=${paging.lastnum+1}"><img src="images/arrow.svg"></a>
		</c:if>
	    <div>
	        <button onclick="location.href='zootopia.do?command=writeCommunityForm'">글 작성하기</button>
	    </div>
	</div>
	
	<div class="serach-form">
    <form name="search" method="get">
        <input type="hidden" name="command" value="communityBoard">
        <input type="text" name="search" value="${search}">
        <input type="submit" value="검색">
    </form>
</div>
	
	<style>
		.pagenation-container { display:flex; align-items: center; justify-content: center; }
		.pagenation-container .nextBtn,
		.pagenation-container .prevBtn { width:9px; position:relative; top:3px; margin:0 10px; }
		.pagenation-container .prevBtn img { transform: rotate(-180deg); }
		.pagenation-container img {width:100%;  }
		.pagenation-container .pagenation-wrapper {   display: flex; font-size: 15px; }
		.pagenation-container .pagenation-wrapper * { width: 25px; height: 25px; display: flex; justify-content: center;
    			align-items: center; color:#999999; border-radius:3px;  }
		.pagenation-container .pagenation-wrapper span { background:#1F1F1F; color:#fff;  }
		.div .button {float: left}
		
		.serach-form { display:flex; justify-content: center; margin-top:50px; }
		.serach-form input[name="search"] { width:287px; border-radius:5px; border:1px solid #D9D9D9; height:45px; margin-right:5px; display:inline-block; }
		.serach-form input[type="submit"] { height:45px; color:#fff; background:#000; border:none; border-radius:4px; }
	
	</style>
	 