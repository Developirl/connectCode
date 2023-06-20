<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_가입요청_리스트</title>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">메일전송</div>
	</nav>

	<form action="emailSend" method="post">
  	<input type="hidden" name="allEmail" value="${allEmail }">
		<div class="m_box" align="center">
			<table width=1200 align="center">
				<tr>
					<td><input id="title" name="title" placeholder="제목을 입력해주세요."
						style="width: 1000px; height: 35px;">
					</td>
				</tr>
				<tr>
					<td><textarea name="content" id="content" colspan="3"
							style="width: 1000px; height: 444px;" class="smart"></textarea></td>
				</tr>
			</table>
			<br> <input type="submit" id="writeBtn" value="보내기"
				class="btn btn-outline-dark"><br>
			<br>
		</div>
	</form>

	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>

<script src="/master/js/smartEditor.js"></script>