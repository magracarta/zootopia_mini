<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<%@ include file="section/mypage_info.jsp" %>


<form class="mywriteform">
<div class="container">
	<h1>내가 쓴 글 (30)</h1>
	<table>
		<thead>
			<tr>
				<th>no.</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td>1.</td>
				<td>[고민] 발바닥이 무진장 까맣다!! <span class="count">[30]</span> </td>
				<td>24/05/28 23:00:00</td>
			</tr>
		</tbody>
	
	</table>
	
	<div>페이지네이션</div>
	
	
	
	<div class="search-container">
        <input type="text" placeholder="검색어를 입력하세요" id="search-input">
      	<input type="button" value="검색" id="search-button">
    </div>
	
	
	
</div>

</form>






<%@ include file="css/mypage_css.jsp" %>
<%@ include file ="../footer.jsp" %>
