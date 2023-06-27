<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<title>ConnectCode</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- 지현 X 2 css -->
<link rel="stylesheet" href="/public/css/jhj.css">
<link rel="stylesheet" href="/mentor/css/mentor.css">

<!-- air-datepicker -->
<link href="/mentor/datepicker/air-datepicker/dist/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all"><!-- Air datepicker css -->

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<!-- JQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<body style="background-color: #f3f3f3;">

	<div class="w3-sidebar w3-bar-block w3-card">
		<div class="logo_div" align="center">
			<font style="color: #fff; font-family:'Angkor', cursive;">CONNECT</font>
			&nbsp;<font style="color: #004EA2; font-family:'Angkor', cursive;">Code</font>
		</div>
		<div class="mentoProfileBox">
			<img class="mentoProfile" src="/public/img/profile_img.png">
		</div>
		<div align="center" style="color: #fff;">${msel.name }</div>
		<div align="center">
			<c:if test="${empty msel.company}">
				소속 없음
			</c:if>
			<c:if test="${!empty msel.company}">
				${msel.company}
			</c:if>
			<br>
			<button class="profileEdit_btn" onclick="location.href='mentorProfileModifyPage?mentor_no=${msel.mentor_no}&member_no=${msel.member_no}'">내 프로필 관리</button>
		</div>

		<hr class="division_hr">

		<a href="mentorPage" class="w3-bar-item w3-button">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
				<path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5Z" />
			</svg>
		&nbsp;&nbsp;대시보드</a>

		<hr class="division_hr">
		
		<a href="mentorAlarmListPage?mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" class="w3-bar-item w3-button">알림&nbsp;<span>${msel.alarm_count}</span></a>
		
		<c:choose>
			<c:when test="${msel.classification != '23'}">
				<button class="w3-button w3-block w3-left-align" style="color: gray;">
					멘토링관리 
					<!-- 잠금 아이콘 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
		    			<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z" />
		  			</svg>
				</button>
			</c:when>
			<c:otherwise>
				<button class="w3-button w3-block w3-left-align" id="accordian" onclick="myAccFunc()">
					멘토링관리 <i class="fa fa-caret-down"></i>
				</button>
				<div id="demoAcc" class="w3-hide w3-white w3-card">
					<a href="mentoringApplyListPage?mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" class="w3-bar-item w3-button dropContent">&nbsp;&nbsp;받은 요청</a>
					<a href="mentoringAcceptedListPage?mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" class="w3-bar-item w3-button dropContent">&nbsp;&nbsp;예약된 상담</a>
					<a href="mentoringFinishedListPage?mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" class="w3-bar-item w3-button dropContent">&nbsp;&nbsp;지난 상담</a>
				</div>
			</c:otherwise>
		</c:choose>
		<a href="mentorInqueryListPage?mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" class="w3-bar-item w3-button">1:1 문의</a>

		<div class="bottomContent">
			
			<hr class="division_hr">

			<a href="mentorPwModifyPage?mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" class="w3-bar-item bottom_a">비밀번호 변경</a>
			<a class="w3-bar-item bottom_a" id="logoutBtn">로그아웃</a>
			<a href="deleteMentor" class="w3-bar-item bottom_a">회원탈퇴</a>
			<form action="/member/logout" method="post" id="logout">
       			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
       		</form>
			<hr class="division_hr">
			
			<a href="/" class="w3-bar-item bottom_a small_jh">
				메인으로 이동&nbsp;&nbsp;
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
				  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
				</svg>
			</a>
			
		</div>

	</div>
	
	<script>
		$("#logoutBtn").on("click", function(e){
			e.preventDefault();
			$("#logout").submit();
		});
	</script>
	
