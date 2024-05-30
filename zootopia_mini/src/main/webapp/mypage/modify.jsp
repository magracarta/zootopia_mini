<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div class="container">
        <h1 class="title">회원 정보 수정</h1>
        <form class="join-form">
            <div class="form-group">
                <label for="username">아이디</label>
                <div class="input-group">
                    <input type="text" id="username" class="form-control">
                    <button type="button" class="btn">중복확인</button>
                </div>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" class="form-control">
            </div>
            <div class="form-group">
                <label for="confirm-password">비밀번호 확인</label>
                <input type="password" id="confirm-password" class="form-control">
                <p class="error-text">* 비밀번호가 일치하지 않습니다.</p>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" class="form-control">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" class="form-control">
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <div class="input-group">
                    <input type="text" id="nickname" class="form-control">
                    <button type="button" class="btn">중복확인</button>
                </div>
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="tel" id="phone" class="form-control">
            </div>
            <div class="form-group">
                <label for="pet-name">반려견 이름</label>
                <input type="text" id="pet-name" class="form-control">
            </div>
            <div class="form-group">
                <label for="pet-type">종류</label>
                <select id="pet-type" class="form-control">
                    <option value="강아지">강아지</option>
                    <option value="고양이">고양이</option>
                </select>
            </div>
            <div class="form-group">
                <label for="pet-gender">성별</label>
                <select id="pet-gender" class="form-control">
                    <option value="남아">남아</option>
                    <option value="여아">여아</option>
                </select>
            </div>
            <div class="form-group">
                <label for="pet-photo">사진</label>
                <input type="file" id="pet-photo" class="form-control">
            </div>
            <button type="submit" class="submit-btn">수정</button>
        </form>
        <p class="login-link">이미 계정이 있으신가요? <a href="#">로그인</a></p>
    </div>


<%@ include file="css/modify.jsp" %>
<%@ include file="../footer.jsp" %>