<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리_멘티</title>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">회원관리</div>
	</nav>

	<div class="m_box2" align="center">
		<span class="large_jh" id="spanBox"> 회원 기본 정보 </span>
		<table border=1 id="mentee_det1">
			<tr align="center">
				<td style="background-color: #f3f3f3;">회원번호</td>
				<td style="background-color: #f3f3f3;">ID</td>
				<td style="background-color: #f3f3f3;">이름</td>
				<td style="background-color: #f3f3f3;">생년월일</td>
				<td style="background-color: #f3f3f3;">성별</td>
			</tr>
			<c:forEach var="mentee" items="${menteelist }">
				<tr align="center">
					<td>${mentee.member_no }</td>
					<td>${mentee.id }</td>
					<td>${mentee.name }</td>
					<td><fmt:formatDate value="${mentee.birthday }"
							pattern="yy.MM.dd"></fmt:formatDate></td>
					<td><c:choose>
							<c:when test="${mentee.gender == 'female'}">여</c:when>
							<c:when test="${mentee.gender == 'male'}">남</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td colspan=2 style="background-color: #f3f3f3;">이메일</td>
				<td colspan=3 style="background-color: #f3f3f3;">핸드폰</td>
			</tr>
			<c:forEach var="mentee" items="${menteelist }">
				<tr align="center">
					<td colspan=2>${mentee.email }</td>
					<td colspan=3>${mentee.phone }</td>
				</tr>
			</c:forEach>
		</table>
		<br> <span class="large_jh" id="spanBox"> 상세 정보 </span>
		<table border=1 id="mentee_det2">
			<tr align="center">
				<td style="background-color: #f3f3f3;">희망직무</td>
				<td style="background-color: #f3f3f3;">기술스택</td>
				<td style="background-color: #f3f3f3;">상담 가능 지역</td>
			</tr>
			<c:forEach var="mentee" items="${menteelist }">
				<tr align="center">
					<td>${mentee.desired_job }</td>
					<td>${mentee.technology_stack }</td>
					<td>${mentee.mentoring_location }</td>
				</tr>
				<tr align="center">
					<td style="background-color: #f3f3f3;">깃</td>
					<td colspan=2>${mentee.git }</td>
				</tr>
				<tr align="center">
				<td style="background-color: #f3f3f3;">블로그</td>
					<td colspan=2>${mentee.blog }</td>
				</tr>


			</c:forEach>
		</table>
		<br> <span class="large_jh" id="spanBox"> 은행 </span>
		<table border=1 id="mentee_det2">
			<tr align="center">
				<td style="background-color: #f3f3f3;">은행명</td>
				<td style="background-color: #f3f3f3;">계좌번호</td>
				<td style="background-color: #f3f3f3;">예금주</td>
			</tr>
			<c:forEach var="mentee" items="${menteelist }">
				<tr align="center">
					<td>${mentee.bank }</td>
					<td>${mentee.account }</td>
					<td>${mentee.account_name }</td>
				</tr>
			</c:forEach>
		</table>

		<div class="btnBox" align="center">
			<c:forEach var="mentee" items="${menteelist }">
				<form action="masterSendMailForm">
					<input type="hidden" name="member_no" value="${mentee.member_no }">
					<br> <input type="submit" value="메일" class="mailBtn" />
				</form>

				<br>
				<input type="submit" value="목록" class="listBtn"
					onClick="history.go(-1)" />

				<form action="memberDelete">
					<input type="hidden" name="member_no" value="${mentee.member_no }">
					<br> <br> <input type="submit" value="탈퇴" class="delBtn" />
				</form>
			</c:forEach>
		</div>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>

</body>
</html>

