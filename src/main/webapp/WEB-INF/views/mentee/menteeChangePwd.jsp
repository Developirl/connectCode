<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../public/header.jsp"%>

		<!-- 실제 콘텐츠 들어가는 부분 -->
		<div class="jisoo-modify-font-noto">
        <div class="container-fluid main-content">
            <div class="row">
                
                <div class="col-2">
                	<%@ include file="sidebar.jsp" %>
                </div>
                <div class="col-2"></div>
                <div class="col-4">
                
                	<div class="hjmain">
						<h2 align="center">비밀번호 변경</h2>
						<form method="post" action="menteeUpdatePw_ok" onsubmit="return check()">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<br>
							<br> <b>비밀번호 변경</b>
							<hr>
							
							<div class="hjjoin_form">
								<label for=passwd class="category">* 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>  
								<input type=password id="password" name="password" class="form-control input">
							</div>
							
							<div class="hjjoin_form">
								<label for=passwd class="category"> 새 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>  
								<input type=password id="newpasswd" name="newpasswd" class="form-control input">
							</div>
							
							<div class="hjjoin_form">
								<label for="passwd2" class="category"> 새 비밀번호 확인 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
								<input type=password id="newpasswd2" name="newpasswd2" class="form-control input"> 
								<span id="alert_success" style="color: green;">비밀번호가 일치합니다.</span>
								<span id="alert_fail" style="color: red;">비밀번호가 일치하지 않습니다.</span>
							</div>
							
							<br><br><br>
							<div align="center">
								<span> <input type="button" id="join_submit" value="취소" class="hjresetBtn" onClick="location.href='main'"/></span>
								<span> <input type="submit" id="join_submit" value="수정" class="hjsubmitBtn" /></span>
							</div>
						</form>
					</div>
					
                </div>
                <div class="col-2"></div>
                <!-- <div class="col-8"> END -->
                <!-- 여백 -->
                <div class="col-2"></div>
            </div>
        </div>
        </div>
	
	<%@ include file="../public/footer.jsp"%>

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
</body>
</html>

