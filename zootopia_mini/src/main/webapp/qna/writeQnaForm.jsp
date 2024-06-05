<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="qna/css/qnacss.css">
<section>
    <div class="form-container">
        <article>
            <form action="zootopia.do?command=writeQna" method="post" >
                <h2 style="text-align: center; font-weight: bold; font-size: 30px;">Q & A </h2>
                <div class="field">
                    <label>작성자</label>
                    <input type="text" name="userid" value="${loginUser.userid}" readonly />
                </div>
                <div class="field">
                    <label>카테고리</label>
	                   <select id="board_category" name="board_category">
						<option value="1">콘테스트 문의</option>
						<option value="2">자유게시판 문의</option>
						<option value="3">기타 문의</option>
						</select>
                </div>
                <div class="field">
                    <label>제목</label>
                    <input type="text" name="subject" />
                </div>
                
                <div class="field">
                    <label>질문 내용</label>
                    <textarea name="content" rows="10" cols="85"></textarea>
                </div>
                <div class="btn">
                    <input type="submit" value="등록" />                    
                     <input type="button" value="취소" onclick="window.location.href='zootopia.do?command=qnaList'"/>
                </div>
            </form>
        </article>
    </div>
</section>
<%@ include file="/qna/css/qna_css.jsp" %>
<%@ include file="../footer.jsp" %>