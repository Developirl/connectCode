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
			width : 350px;
			height: 400px;
			margin: 0 auto;
			vertical-align: center;
		}
		
		@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap');
		.mino-loginBoxTitle{
			font-family: 'Playfair Display', serif;
			color: #004EA2;
			font-size: 40px;
			font-weight: 700;
		}
		
		.mino-loginButton{
			width: 150px;
			font-size: 30px;
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
									<div class="mino-loginBoxTitle col-12">
										Login.
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
								<div class="row" style="height: 50px"></div>
								<div class="row">
									<div class="mino-loginBtn col-12" style="text-align:center;">
										<button type="submit" class="mino-loginButton btn btn-outline-primary">Login</button>
									</div>
								</div>
								<div class="row" style="height: 30px" ></div>
								<div class="row">
									<div class="mino-loginOptions col-12" style="text-align:center;">
										<a href="javascript:window.open('/member/menteefind_idform','id찾기','width=500 height=450 left=500 top=200')" style="text-decoration: none;">아이디 찾기</a> | 
										<a href="javascript:window.open('/member/menteefind_pwform','비밀번호 찾기','width=500 height=450 left=500 top=200')" style="text-decoration: none;">비밀번호 찾기</a> | 
										<a href="/member/normalmenteejoin" style="color: black; text-decoration: none;" >회원가입</a>
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
</body>
</html>