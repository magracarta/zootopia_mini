<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<article>
			<form action="zootopia.do?command=writeCommunity" method="post" >
				<h2> Q & A Write</h2>
				<div class="field" >
					<label>작성자</label>
					<input type="text" name="userid" value="${post.userid}" readonly />
				</div>
				<div class="field" >
					<label>제목</label><input type="text" name="subject"  >
				</div>
				<div class="field" >
					<label>질문내용</label>
					<textarea name="content" rows="10"  cols="85"></textarea>
				</div>
				<div class="btn" >
		   			<input type="submit" value="작성하기" />	
		   		</div>	
			</form>
		</article>

	</div>