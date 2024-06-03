<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<article>
    <form action="zootopia.do?command=writeCommunity" method="post">
        <h2> 자유게시판 양식 </h2>
        <div class="field">
            <label>작성자</label>
            <input type="text" name="userid" value="${loginUser.userid}" readonly/>
        </div>
        <div class="field">
            <label>닉네임</label>
            <input type="text" name="nickname" value="${loginUser.nickname}" readonly />
        </div>
        <div class="field">
            <label>카테고리 선택</label>
            <select name="kind">
                <option value="1">고민</option>
                <option value="2">자랑</option>
                <option value="3">잡담</option>
            </select>
        </div>
        <div class="field">
            <label>제목</label>
            <input type="text" name="subject" />
        </div>
        <div class="field">
            <label>질문내용</label>
        </div>
		<div>
            <textarea name="content" rows="10" cols="85"></textarea>
		</div>
        <div class="btn">
            <input type="submit" value="작성하기" />
        </div>
    </form>
</article>

</script>