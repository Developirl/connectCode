<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_대시보드</title>

<!-- **************병걸*************** -->
	<script>
		var totalVisitors = ${totalVisitors};
		var todayVisitors = ${todayVisitors};
		var mentors = ${mentors};
		var mentees = ${mentees};
		var unreadyMentors = ${unreadyMentors};
		var readyMentors = ${readyMentors};
	</script>
<!-- **************병걸*************** -->

</head>
<body>

	<%@ include file="../public/sidebar_hj.jsp"%>

	<nav class="navbar navbar-light">
		<div class="navbar-brand">대시보드</div>
	</nav>

	<div class="w3-container">
		<div class="chartbox1" align="center">
			<canvas id="myChart1" width="350" height="250"></canvas>
		</div>
		<div class="chartbox2">
			<canvas id="myChart2" width="310" height="250" style="float: left;"></canvas>
			<canvas id="myChart3" width="310" height="250" style="float: left;"></canvas>
		</div>

		<div class="totalbox1">
			<div class="large_jh" align="center">
				<div class="totalbox2" align="center">TOTAL</div>
				<a href="masterMentorApplyList" style="color: gray">멘토 승인 요청 &nbsp;${newMentor }</a><br><br>
				<a href="masterPaymentList" style="color: gray">오늘 발생한 결제 건수 &nbsp;${newPay }</a> <br> <br>
				<a href="masterInquireList" style="color: gray">새로운 문의 요청&nbsp; ${newinquire}</a>
				<%-- <a href="masterReportList" style="color: gray">신고 건수&nbsp; ${newReport }</a>  --%>
			</div>
		</div>

<div class="statisticsbox1">
		<div class="large_jh" align="center">
			<div class="statisticsbox2" align="center">통계</div>
			<a href=masterStatistics1 style="color: gray"><br>이용자 성비 <br></a>
			<a href=masterStatistics2 style="color: gray"><br>이용자 현황 <br></a> 
		</div>

	</div>
</div>

	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="/master/js/master.js"></script>
