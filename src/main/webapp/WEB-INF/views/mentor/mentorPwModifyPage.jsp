<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

<form method="post" action="mentorUpdatePw_ok" id="myform" onsubmit="return check()">
	<div class="w3-container">
		<div class="fixedTop_div"></div>
		<font class="large_jh">비밀번호 변경</font>
		<hr class="title_hr">
		
		<!-- CONTENT -->
		<div align="center" class="cont_mar" style="margin-top: 100px;">
			<img src="/mentor/img/password.png" style="width: 200px;">		
		</div>

		<div class="cont_mar" style="padding: 0px 200px;">
			<hr class="title_hr" style="margin: 50px 0px;">
			<br>
			<br>
			<div align="center" class="medium_jh infoTitle" style="display: flex;">
				<div class="passTitle_jh" style="width: 40%;">현재 비밀번호</div>
				<div style="width: 60%; text-align: left;">
					<input type="password" class="passInput_jh" id="password" name="password"  autofocus="autofocus">
				</div>
			</div>
			<div align="center" class="medium_jh infoTitle" style="display: flex;">
				<div class="passTitle_jh" style="width: 40%;">새 비밀번호</div>
				<div style="width: 60%; text-align: left;">
					<input type="password" class="passInput_jh" id="newpasswd" name="newpasswd" >
				</div>
			</div>
			<div align="center" class="medium_jh infoTitle" style="display: flex;">
				<div class="passTitle_jh" style="width: 40%;">새 비밀번호 확인</div>
				<div style="width: 60%; text-align: left;">
					<input type="password" class="passInput_jh" id="newpasswd2" name="newpasswd2">
					<span id="alert_success" style="color: green;">비밀번호가 일치합니다.</span>
					<span id="alert_fail" style="color: red;">비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>
			<br>
			<hr class="title_hr" style="margin: 50px 0px;">
		</div>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<!-- 변경 btn -->
		<div class="cont_mar">
			<div align="center" class="medium_jh infoTitle">
				<input type="button" class="custom_btn" id="join_submit" value="취소" style="width: 150px;" onClick="location.href='mentorPage'"/>
				<input type="submit" class="custom_btn" id="join_submit" value="비밀번호 변경" style="width: 200px;">
			</div>
		</div>
	<!-- CONTENT end -->
	
	</div>
</form>

<script>
	function check() {
		if ($.trim($("#password").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#password").val("").focus();
			return false;
		}
		if ($.trim($("#newpasswd").val()) == "") {
			alert("새 비밀번호를 입력하세요.");
			$("#newpasswd").val("").focus();
			return false;
		}
		if ($.trim($("#newpasswd2").val()) == "") {
			alert("새 비밀번호 확인을 입력하세요.");
			$("#newpasswd2").val("").focus();
			return false;
		}
		if ($.trim($("#newpasswd").val()) != $.trim($("#newpasswd2").val())) {
			alert("새 비밀번호가 일치하지 않습니다.");
			$("#newpasswd").val("");
			$("#newpasswd2").val("");
			$("#newpasswd").focus();
			return false;
		}
	} // check() 함수 끝
	
	$("#alert_success").hide();
	$("#alert_fail").hide();
	$("input").keyup(function() {
		var passwd = $("#newpasswd").val();
		var passwd2 = $("#newpasswd2").val();
		if (passwd != "" || passwd2 != "") {
			if (passwd == passwd2) {
				$("#alert_success").show();
				$("#alert_fail").hide();
				$("#join_submit").removeAttr("disabled");
			} else {
				$("#alert_success").hide();
				$("#alert_fail").show();
			}
		}
	
	});
</script>

<%@ include file="../public/sidebar_footer.jsp" %>
