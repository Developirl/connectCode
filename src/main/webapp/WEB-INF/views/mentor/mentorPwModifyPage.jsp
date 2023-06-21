<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

<form method="post" action="" id="myform">
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
					<input type="text" class="passInput_jh" autofocus="autofocus">
				</div>
			</div>
			<div align="center" class="medium_jh infoTitle" style="display: flex;">
				<div class="passTitle_jh" style="width: 40%;">새 비밀번호</div>
				<div style="width: 60%; text-align: left;">
					<input type="text" class="passInput_jh">
				</div>
			</div>
			<div align="center" class="medium_jh infoTitle" style="display: flex;">
				<div class="passTitle_jh" style="width: 40%;">새 비밀번호 확인</div>
				<div style="width: 60%; text-align: left;">
					<input type="text" class="passInput_jh">
				</div>
			</div>
			<br>
			<hr class="title_hr" style="margin: 50px 0px;">
		</div>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<!-- 변경 btn -->
		<div class="cont_mar">
			<div align="center" class="medium_jh infoTitle">
				<input type="submit" class="custom_btn" value="비밀번호 변경" style="width: 200px;">
			</div>
		</div>
	<!-- CONTENT end -->
	
	</div>
</form>

<%@ include file="../public/sidebar_footer.jsp" %>
