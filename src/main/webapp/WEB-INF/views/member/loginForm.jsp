<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login Board</title>

<link rel="stylesheet" type="text/css" href="/member/css/login.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function showNormalLoginForm() {
		document.getElementById("normalLogin").style.display = "block";
		document.getElementById("businessLogin").style.display = "none";
	}

	function showBusinessLoginForm() {
		document.getElementById("normalLogin").style.display = "none";
		document.getElementById("businessLogin").style.display = "block";
	}

	function loginNormal() {
		// 일반회원 로그인 처리 로직
	}

	function loginBusiness() {
		// 비즈니스회원 로그인 처리 로직
	}
</script>

</head>
<body>



	<!------------------------------ 전체 프레임 ------------------------------>
	<div id="frame">
		<!-- 네비게이션 바/부트스트랩 -->
		<%@ include file="../public/header.jsp"%>
		<!-- 실제 콘텐츠 들어가는 부분 -->
		<div class="container-fluid main-content">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8">
					<!--  @@@@@@@@@@@@@@@여기다가 작업하세요@@@@@@@@@@@@@@@ -->
					<div class="login-wrap">
						<div class="login-html" id="normalLogin">
							<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
								for="tab-1" class="tab">멘티 로그인</label> <input id="tab-2"
								type="radio" name="tab" class="sign-up"><label
								for="tab-2" class="tab">멘토 로그인</label>
							<div class="login-form">
							<!-- 폼 시작 -->
								<form action="/member/menteeLogin" method="post">
								<div class="sign-in-htm">
									<div class="group">
										<label for="user" class="label">ID</label> <input id="user"
											type="text" name="id" class="input" placeholder="ID를 입력하세요">
									</div>
									<div class="group">
										<label for="pass" class="label">Password</label> <input
											id="pass" type="password" name="password" class="input" data-type="password"
											placeholder="비밀번호를 입력하세요">
									</div>
									<br>
									
										<div class="group">
										<input type="submit" class="button" value="멘티 로그인"
											onclick="loginNormal()">
									
										<a class="kakaoLogin"
										href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${restapikey}&redirect_uri=http://localhost:80/member/kakaoLogin">
										<img src="/member/images/kakao.png" class="KakaoButton" />
										</a>
									</div>
									<div class="hr"></div>
									<div class="foot-lnk">
										<a href="javascript:window.open('/member/menteefind_idform','id찾기','width=500 height=450 left=500 top=200')" style="text-decoration: none;">아이디 찾기</a> | 
										<a href="javascript:window.open('/member/menteefind_pwform','비밀번호 찾기','width=500 height=450 left=500 top=200')" style="text-decoration: none;">비밀번호 찾기</a> | 
										<a href="/member/normalmenteejoin" style="color: black; text-decoration: none;" >회원가입</a>
									</div>
								</div>
								</form>

								<!-- 용경이 멘토폼 -->
								<form action="/member/mentorLogin" method="post">
								<div class="sign-up-htm" id="businessLogin">
									<div class="group">
										<label for="user" class="label">ID</label> <input id="user"
											type="text" class="input" placeholder="ID를 입력하세요">
									</div>
									<div class="group">
										<label for="pass" class="label">Password</label> <input
											id="pass" type="password" class="input" data-type="password"
											placeholder="비밀번호를 입력하세요">
									</div>

									<div class="group">
										<input type="submit" class="button" value="멘토 로그인"
											onclick="loginBusiness()">
									</div>
									<div class="hr"></div>
									<div class="foot-lnk">
										<a href="javascript:window.open('/member/mentorfind_idform','id찾기','width=500 height=450 left=500 top=200')" style="text-decoration: none;">아이디 찾기</a> | 
										<a href="javascript:window.open('/member/mentorfind_pwform','비밀번호 찾기','width=500 height=500 left=500 top=200')" style="text-decoration: none;">비밀번호 찾기</a> | 
										<a href="/member/mentorjoin" style="color: black; text-decoration: none;" >회원가입</a>
									</div>
								</div>
								
								</form>
								<!-- 용경이 멘토폼 끝 -->
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-2"></div>
		</div>
	</div>
	<%@ include file="../public/footer.jsp"%>
	<!------------------------------ 전체 프레임 end ------------------------------>
</body>
</html>