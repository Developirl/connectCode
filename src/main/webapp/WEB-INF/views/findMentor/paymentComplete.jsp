<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<head>
<%-- 부트 스트랩 아이콘을 class로 가져다 사용하기 위한 CDN --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<style>
/* 내가 사용하는 개인 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');

.js-completebox{
	width:800px;
	background: #F2F5F5;
	padding: 100px 100px;
}

.js-completebox *{
	font-family: 'Noto Sans KR', sans-serif!important;
	color:#5D5D5D;
}

.js-completebox a{
	text-decoration: none;
}

.js-completebox a:hover{
	text-decoration: underline;
	color:#333333;
}

.js-complete-content{
	border:1px solid #ccc;
	border-right: none;
	border-left:none;
	padding:30px 15px;
	font-size:12pt;
	margin:60px 0px;
}

.js-complete-titlefont{
	font-size:14pt;
	font-weight: bold;
}

.js-complete-content table td,.js-complete-content table th{
	padding:10px 0;
}


.bi-receipt-cutoff{
	font-size:100px!important;
}
.js-paypayimg{
	width: 200px;
	height: 160px;
	color:#004EA2;
}
</style>


<script src="http://code.jquery.com/jquery-latest.js"></script>


<script>

	
</script>



</head>


<%@ include file="../public/header.jsp"%>


<!-- 실제 콘텐츠 들어가는 부분 -->
<div class="container-fluid main-content">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8" align=center>
			<%-- 여기 아래서만 작업 합니다.  --%>
			
			<div class="js-completebox">
			
			
			<div><img src="/findMentor/img/Payment.png" class="js-paypayimg"></div>
			<br>
			<div class="js-complete-titlefont">결제완료</div>
			
			<div class="js-complete-content">
			<table width="60%">
				<tr>
				<td>결제 번호</td><td align="right">${mentoring.order_no }</td>
				</tr>			
				<tr>
				<td>결제 일시</td>
				<td align="right">
				<fmt:formatDate value="${mentoring.pay_time }" pattern="yyyy-MM-dd  HH:mm"></fmt:formatDate>
				</td>
				</tr>			
				<tr>
				<td>멘토링 유형</td><td align="right">${mentoring.mentoring_kind }</td>
				</tr>			
				<tr>
				<td>멘토링 예약일</td>
				<td align="right">
				<fmt:formatDate value="${mentoring.reserve_date }" pattern="yyyy-MM-dd  HH:mm"></fmt:formatDate>
				</td>
				</tr>			
			</table>
			</div>
			
			<a href="/mentee/main">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/mentee/myMentoringHistoryPage">예약 내역 확인</a>
			
			
			</div>
			 
			<%-- 여기까지가 작업하는 라인 --%>
		</div>
		<div class="col-2">
			<!-- <div class="js-toparrow" onclick="scrollToTop();">  아ㅣㄴ 여기 왜 안돼 ..
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#D5D5D5" class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
		  			<path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
				</svg>
			</div> -->
		</div>
	</div>
</div>

<%@ include file="../public/footer.jsp"%>
