<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function() {
	  document.getElementById("kakaotest").submit();
	};


</script>

</head>
<body>
<form id="kakaotest" action="/member/menteeLogin" method="post">
<input type="hidden" name="id" value="${id }">
<input type="hidden" name="password" value="${uuid}">
</form>

</body>
</html>