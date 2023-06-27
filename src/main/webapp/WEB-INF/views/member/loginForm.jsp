<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login Board</title>

<!-- <link rel="stylesheet" type="text/css" href="/member/css/login.css"> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
	<style type="text/css">
		.mino-loginBoxWrap{
			display: flex;
			align-items: center;
			vertical-align: center;
			height: 650px;
			
		}
		.mino-loginBox{
			padding: 20px;
			width : 380px;
			height: 450px;
			margin: 0 auto;
			vertical-align: center;
			box-shadow: 2px 2px 50px 1px #E2E2E2;		
		}
		
		@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap');
		 @import url('https://fonts.googleapis.com/css2?family=Angkor&display=swap');
		.mino-loginBoxTitle{
			/* font-family: 'Playfair Display', serif; */
			 font-family: 'Angkor', cursive; 
			/* font-family: 'Kanit', sans-serif; */
			color: #004EA2;
			font-size: 35px;
			font-weight: 300;
			margin-bottom: 10px;
		}
		
		.mino-loginButton{
			width: 310px;
			height: 38px;
			font-size: 30px;
			border: none;
			border-radius: 5px;
			background-color: #0080FF;
			color: white;
			font-weight: bold;
    		font-size: 20px;px;
    		font-family: 'Kanit', sans-serif;
    		padding-bottom: 3px;
		}
		
		.mino-loginButton:hover{
			background-color: darkgray;
		}
		
		@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@500&display=swap');
		.remchk{
		margin-top: 13px;
		font-family: 'Kanit', sans-serif;
		}
		
		.mino-loginOptions{
			font-family: 'Kanit', sans-serif;
		}
		
		 /* 체크박스 숨기기 */
		.ys_remember input[type="checkbox"] {
  			position: absolute;
  			opacity: 0;
  			width: 0;
  			height: 0;
		}

/* 커스텀 체크박스 스타일 */
		.ys_remember label {
  			position: relative;
  			padding-left: 30px; /* 체크박스 왼쪽 여백 조절 */
  			cursor: pointer;
  			font-weight: bold;
		}

/* 체크박스의 외부 박스 스타일 */
		.ys_remember label:before {
  			content: "";
 			position: absolute;
  			left: 0;
  			top: 0;
  			width: 20px; /* 외부 박스의 너비 */
  			height: 20px; /* 외부 박스의 높이 */
  			border: 2px solid #999; /* 외부 박스의 테두리 스타일과 색상 */
  			border-radius: 4px; /* 외부 박스의 모서리 둥글기 조절 */
  			margin-top: 2px;
		}

/* 체크된 상태의 체크박스 스타일 */
		.ys_remember input[type="checkbox"]:checked + label:before {
  			background-color: #007bff; /* 체크된 상태의 색상 */
  			border-color: #007bff; /* 체크된 상태의 테두리 색상 */
		}

/* 체크된 상태의 체크마크 스타일 */
		.ys_remember input[type="checkbox"]:checked + label:after {
 			content: "\2713"; /* 체크마크 텍스트 또는 아이콘 사용 */
  			position: absolute;
  			left: 5px; /* 체크마크 위치 조절 */
  			top: 1px; /* 체크마크 위치 조절 */
  			color: #fff; /* 체크마크 색상 */
  			font-size: 14px; /* 체크마크 크기 */
		}
		
	</style>
</head>
<body>

	<!------------------------------ 전체 프레임 ------------------------------>
		<!-- 네비게이션 바/부트스트랩 -->
		<%@ include file="../public/header.jsp"%>
		<!-- 실제 콘텐츠 들어가는 부분 -->
		<div class="container-fluid main-content">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8">
					<!--  @@@@@@@@@@@@@@@여기다가 작업하세요@@@@@@@@@@@@@@@ -->
					<div class="container-fluid mino-loginBoxWrap">
					
						<div class="mino-loginBox">
						
							<form action="/member/login" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<div class="row">
									<div class="mino-loginBoxTitle col-12" align="center">
										Login
									</div>
								</div>
								<div class="row" style="height: 35px"></div>
								<div class="row">
									<div class="mino-loginInputBox col-12">
										<input class="mino-loginInputBox form-control" type="text" name="id" placeholder="ID">
									</div>
								</div>
								<div class="row" style="height: 20px"></div>
								<div class="row">
									<div class="mino-loginInputBox col-12">
										<input class="mino-loginInputBox form-control" type="password" name="password" placeholder="Password">
									</div>
								</div>
								<div class="row" style="height: 70px">
									<div class="ys_remember">								
									<input type="checkbox" name="remember-me" id="myCheckbox">
									<label for="myCheckbox" class="remchk">Remember Me</label>
									</div>
									
								
								</div>
								<div class="row">
									<div class="mino-loginBtn col-12" style="text-align:center;">
										<button type="submit" class="mino-loginButton">Login</button>
									</div>
								</div>
								<div class="row" style="height: 30px" ></div>
								<div class="row">
									<div class="mino-loginOptions col-12" style="text-align:center;">
										<a href="javascript:window.open('/member/find_idform','id찾기','width=500 height=450 left=500 top=200')" style="text-decoration: none;">아이디 찾기</a> | 
										<a href="javascript:window.open('/member/find_pwform','비밀번호 찾기','width=500 height=450 left=500 top=200')" style="text-decoration: none;">비밀번호 찾기</a> | 
										<a href="/member/chooseForm" style="color: black; text-decoration: none;" >회원가입</a>
									</div>
								</div>
								
							</form>
						</div>
					<%-- <div class="login-wrap">
						<div class="login-html" id="normalLogin">
						
							
							<div class="login-form">
							<!-- 폼 시작 -->
								<form action="/member/login" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<div class="sign-in-htm">
									<div class="group">
										<label for="user" class="label">ID</label>
										<input id="user" type="text" name="id" class="input" placeholder="ID를 입력하세요">
									</div>
									<div class="group">
										<label for="pass" class="label">Password</label>
										<input id="pass" type="password" name="password" class="input" data-type="password"	placeholder="비밀번호를 입력하세요">
									</div>
									<br>
									
									<div class="group">
										<input type="submit" class="button" value="멘티 로그인"	onclick="loginNormal()">
									</div>
									<div class="hr"></div>
									<div class="foot-lnk">
										
									</div>
								</div>
								</form>
							</div>
						</div>
					</div> --%>
						
					</div>
				</div>

			</div>
				<!-- <div class="col-8"> End -->
			<div class="col-2"></div>
		</div>
	<%@ include file="../public/footer.jsp"%>
	<!------------------------------ 전체 프레임 end ------------------------------>
	<script>
		$(document).ready(function(){
			var error = "${error}";
			if(error == "true"){
				alert("로그인 정보가 올바르지 않습니다.");
			}
		});
	</script>
</body>
</html>