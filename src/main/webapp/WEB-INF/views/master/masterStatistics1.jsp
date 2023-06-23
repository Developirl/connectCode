<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 현황</title>
<script>
	var male = ${male};
	var female = ${female};
	var eemale = ${eemale};
	var eefemale = ${eefemale};
	var tmale = ${tmale};
	var tfemale = ${tfemale};
</script>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">이용자 성비</div>
	</nav>

	<div class="m_box">

		<div class="chartbox3">
			<canvas id="myChart4" width="500" height="500"></canvas>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<canvas id="myChart5" width="500" height="500"></canvas>
		</div>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="/master/js/user.js"></script>