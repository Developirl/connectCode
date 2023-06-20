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
<link rel="stylesheet" href="/public/css/jhj.css">
<link rel="stylesheet" href="/master/css/master.css"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body style="background-color: #f3f3f3;">

	<div class="w3-sidebar w3-bar-block w3-card">
		<div class="logo_div" align="center">
			<font style="color: white; font-family:'Angkor', cursive;">CONNECT</font>
			&nbsp;<font style="color: #004EA2; font-family:'Angkor', cursive;">Code</font>
		</div>
		<div class="mentoProfileBox">
			<img class="mentoProfile" src="/master/img/master_img.jpg">
		</div>
		<div align="center" style="color: white;">관리자</div>

		<hr class="division_hr">

		<a href="/" class="w3-bar-item w3-button">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
				<path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5Z" />
			</svg>
		&nbsp;&nbsp;메인화면</a>
		
		<hr class="division_hr">
		
		<div align="center">
		<a href="masterMainPage" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대시보드</a>
		<a href="masterMentorApplyList" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;승인요청</a>
		<a href="masterInquireList" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의요청</a>
		<a href="masterMemberList" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원관리</a>
		<a href="masterPaymentList" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제관리</a>
		<a href="masterReportList" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신고관리</a>
		</div>

	</div>
	
	