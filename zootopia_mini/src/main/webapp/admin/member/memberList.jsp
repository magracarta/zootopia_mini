<%@  page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>

<article>
	<form method="post" name="frm">
		<div class="tb">
			<div class="row" style="margin-bottom:20px; font-size:32px;">회원 관리</div>
			<div class="row">
				<div class="col-search">
					<img style="width:40px; height:39px; border-bottom:1px solid #C9C9C9; 
					padding:0; margin:0;" 
					src="admin/images/search.png"
					onClick="go_search('adminmemberlist')"/>
					<input type="text" name="key" value="${key}" placeholder="성명"/>
				</div>
			</div>
			<div class="row-subject">
				<div class="coltitle" style="flex:1">아이디</div>
				<div class="coltitle" style="flex:1">닉네임</div>
				<div class="coltitle" style="flex:1">이름</div>
				<div class="coltitle" style="flex:2">전화번호</div>
				<div class="coltitle" style="flex:2">이메일</div>
				<div class="coltitle" style="flex:2">가입일</div>
				<div class="coltitle" style="flex:1">관리</div>
			</div><hr>

			<c:forEach items="${memberList}" var="memberVO">
				<div class="row-list" style="border-bottom:1px solid #CFCFCF;">
					<div class="col" style="flex:1">${memberVO.userid}</div>
					<div class="col" style="flex:1">${memberVO.nickname}</div>
					<div class="col" style="flex:1">${memberVO.name}</div>
					<div class="col" style="flex:2">${memberVO.phone}</div>
					<div class="col" style="flex:2">${memberVO.email}</div>
					<div class="col" style="flex:2"><fmt:formatDate value="${memberVO.createdate}"/></div>
					<div class="col" style="flex:1">
						<img src="admin/images/settings2.png" onClick="location.href='zootopia.do?command=adminmemberdetail'"/> 
					</div>
				</div>
			</c:forEach>
		</div>
	</form>
</article>


<%@ include file="/admin/footer.jsp" %>
