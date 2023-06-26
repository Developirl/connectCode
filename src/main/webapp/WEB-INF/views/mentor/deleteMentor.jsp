<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<%@ include file="../public/header.jsp"%>
	<div class="col-lg-8 container">

				<div id="hjdelete_wrap" align=center>
					<form method="post" action=mentorDel_ok onsubmit="return check()">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

						<h2 class=hjtitle1>정말 <span class=hjtitle2>탈퇴</span> 하시겠습니까?</h2>
						<span class=hjtitle3>비밀번호를 입력하시면 회원탈퇴가 완료됩니다.</span>

						<table align=center id=table>
							<tr>
								<td>
								<input type="password" id="password" name="password" placeholder="비밀번호" class="hjpasswd" style="width: 504px;"> </input>
								</td>
							</tr>
							<tr>
								<td>
									<textarea cols=60px rows=5 id="quit_reason" name="quit_reason" placeholder="탈퇴 이유를 작성해주세요."></textarea>
								</td>
							</tr>
						</table>

						<div align=center>
							<input type="submit" value="확인" class="hjinput1" /><br>
							<input type="button" value="취소" class="hjinput2" onclick="history.go(-1);"/><br>
						</div>

					</form>
				</div>
			</div>
			<div class="col-lg-2 container"></div>
			<!-- 우측 빈 여백 -->

<%@ include file="../public/footer.jsp"%>
</body>
</html>

<script>
function check(){
	 if($.trim($("#password").val())==""){
		 alert("비밀번호를 입력하세요");
		 $("#passwd").focus();
		 return false;
	 }
	 if($.trim($("#quit_reason").val())==""){
		 alert("탈퇴 이유를 작성해주세요");
		 $("#delcontent").focus();
		 return false;
	 }
}
</script>