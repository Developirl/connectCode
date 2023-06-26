<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 상세</title>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">문의요청</div>
	</nav>

	<form action="inquireRelpy">
		<input type="hidden" name="post_no" value="${post.post_no }">
		<div class="m_box" align="center">
			<table border=1>
				<tr>
					<td width=70 align="center">작성자</td>
					<td width=440>${post.name }</td>
					<td width=70 align="center">작성일</td>
					<td><fmt:formatDate value="${post.reg_date }"
							pattern="yy.MM.dd" /></td>
				</tr>
				<tr>
					<td width=70 align="center">제목</td>
					<td width=1000 height=40 colspan=3>${post.title }</td>
				</tr>
				<tr>
					<td width=70 align="center">내용</td>
					<td width=1000 height=200 colspan=3>${post.content }</td>
				</tr>
			</table>
			<hr>
			<textarea id="reply" name="reply" cols=125 rows=12
				placeholder="답변을 작성해주세요."></textarea>
			<br> <br> <input type="submit" class="btn btn-dark" value="답변하기"> <br>
			<br>

		</div>
	</form>


	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>