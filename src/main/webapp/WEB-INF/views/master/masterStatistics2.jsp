<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 현황</title>
<script>
	var sign_up =${sign_up};
	var lastsign_up =${lastsign_up};
	var Tsign_up =${Tsign_up};
	var quit =${quit};
	var lastquit =${lastquit};
	var Tquit =${Tquit};
</script>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">이용자 현황</div>
	</nav>

	<div class="m_box">
			<div class="chartbox3">
			<canvas id="myChart6" width="520" height="500"></canvas>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<canvas id="myChart7" width="520" height="500"></canvas>
			</div>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="/master/js/user2.js"></script>