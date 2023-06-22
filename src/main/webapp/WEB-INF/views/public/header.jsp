<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ConnectCode</title>

    <!-- 부트스트랩 css CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"/>

    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <!-- Gothic A1(font-family: 'Gothic A1', sans-serif;) -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@400;700&display=swap">
    <!-- ANGKOR(font-family: 'Angkor', cursive;) -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Angkor&display=swap">

    <!-- 병걸 css -->
    <link rel="stylesheet" href="/public/css/public.css"/>
    <!-- 지수 css -->
    <link rel="stylesheet" href="/findMentor/css/findMentor.css"/>
    <!-- 지현 X 2 css -->
    <link rel="stylesheet" href="/mentor/css/mentor.css"/>
    <!-- 혜지 css -->
    <link rel="stylesheet" href="/master/css/master.css"/>
    <!-- 용경, 성훈 css -->
    <link rel="stylesheet" href="/member/css/member.css"/>
    <!-- 우철 css -->
    <link rel="stylesheet" href="freeMentoring/css/freeMentoring.css"/>
    <!-- 주아, 인철 css -->
    <link rel="stylesheet" href="/mentee/css/mentee.css"/>

    <!-- JQuery CDN -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <!-- 전체 랩퍼 START -->
    <div class="wrapper">

       <!-- 헤더 -->
        <header>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-2 mino-title">CONNECT <span style="color: #004EA2;">Code</span></div>
                    <nav class="col-4">
                        <ul class="nav nav-ul">
                            <li class="nav-item">
                                <a class="nav-link" href="/">홈</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/findMentor/mentorlistpage">멘토찾기</a>
                            </li>
                            <!-- <li class="nav-item">
                                <a class="nav-link" href="#">무료멘토링</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">취업정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">학원정보</a>
                            </li> -->
                        </ul>
                    </nav>
                    <div class="col-2">
                        <ul class="navbar-nav">
                            <li class="nav-item" style="text-align:right;">
                            	<sec:authorize access="isAnonymous()">
	                                <a class="nav-link mino-align-right" href="/member/loginform">회원가입/로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                            	</sec:authorize>
                            	<sec:authorize access="isAuthenticated()">
                            		<sec:authorize access="hasRole('ROLE_12')">
                            			<a href="#">멘티마이페이지</a>
                            		</sec:authorize>
                            		<sec:authorize access="hasRole('ROLE_13')">
                            			<a href="#">멘토마이페이지</a>
                            		</sec:authorize>
                            		<sec:authorize access="hasRole('ROLE_11')">
                            			<a href="#">관리자 대쉬보드</a>
                            		</sec:authorize>
                            		<form action="/member/logout" method="post">
                            			<input type="submit" value="로그아웃" />
                            			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            		</form>
                            	</sec:authorize>
                            </li>
                        </ul>
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
        </header>
        <!-- 헤더 END -->