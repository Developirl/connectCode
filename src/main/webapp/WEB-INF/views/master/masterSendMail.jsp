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

	<form action="emailSend" method="post" onsubmit="return check()">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  	<input type="hidden" name="allEmail" value="${allEmail }">
		<div class="m_box" align="center">
			<div class="mail_box" align="center">
			<table width=1004 align="center">
				<tr align="center">
					<td><input id="title" name="title" placeholder="제목을 입력해주세요."
						style="width: 1000px; height: 35px;">
					</td>
				</tr>
				<tr align="center">
					<td><textarea name="content" id="content" colspan="3"
							style="width: 1000px; height: 444px;" class="smart"></textarea></td>
				</tr>
			</table>
			<br> <input type="submit" id="writeBtn" value="보내기"
				class="btn btn-dark"><br>
			<br>
			</div>
		</div>
	</form>

	<%@ include file="../public/sidebar_footer.jsp"%>
	
	<script>
function check(){

	if($.trim($("#title").val())==""){
		alert("제목을 입력하세요.");
		$("#title").focus;
		return false;	
	}
	
 	var content = document.getElementById("content").value;
 	$('#content').val(content);
 	if (content == '<p>&nbsp;</p>') { //비어있는 경우
		alert("내용을 입력해주세요.")
		oEditors.getById["content"].exec("FOCUS")
		return false;
	}
 
}
</script> 
</body>
</html>

<script src="/master/js/smartEditor.js"></script>