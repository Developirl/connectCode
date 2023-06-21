<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리_멘토</title>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">회원관리</div>
	</nav>

	<div class="m_box3" align="center">
		<img src=${mentor.file_url } id="mentor_profile" />

		<table border=1 id="mentor_det11">
		<span class="large_jh" id="spanBox11"> 회원 기본 정보 </span>
			<tr align="center">
				<td style="background-color: #f3f3f3;">회원번호</td>
				<td style="background-color: #f3f3f3;">ID</td>
				<td style="background-color: #f3f3f3;">이름</td>
				<td style="background-color: #f3f3f3;">생년월일</td>
				<td style="background-color: #f3f3f3;">성별</td>
			</tr>
			<tr align="center">
				<td>${mentor.member_no }</td>
				<td>${mentor.id }</td>
				<td>${mentor.name }</td>
				<td><fmt:formatDate value="${mentor.birthday }"
						pattern="yy.MM.dd" /></td>
				<td><c:choose>
						<c:when test="${mentor.gender == 'female'}">여</c:when>
						<c:when test="${mentor.gender == 'male'}">남</c:when>
					</c:choose></td>
			</tr>
			<tr align="center">
				<td colspan=2 style="background-color: #f3f3f3;">핸드폰</td>
				<td colspan=3 style="background-color: #f3f3f3;">이메일</td>
			</tr>
			<tr align="center">
				<td colspan=2>${mentor.phone }</td>
				<td colspan=3>${mentor.email }</td>
			</tr>
		</table>

		<br>
		<table border=1 id="mentor_det11">
		<span class="large_jh" id="spanBox11"> 학벌 </span>
			<tr align="center">
				<td style="background-color: #f3f3f3;">학교</td>
				<td style="background-color: #f3f3f3;">학위</td>
				<td style="background-color: #f3f3f3;">전공</td>
				<td style="background-color: #f3f3f3;">부전공</td>
				<td style="background-color: #f3f3f3;">입학일</td>
				<td style="background-color: #f3f3f3;">졸업일</td>
			</tr>
			<c:forEach var="education" items="${education }">
				<tr align="center">
					<td>${education.school }</td>
					<td>${education.degree }</td>
					<td>${education.major }</td>
					<td>${education.minor }</td>
					<td><fmt:formatDate value="${education.e_date}"
							pattern="yy.MM.dd" /></td>
					<td><fmt:formatDate value="${education.g_date}"
							pattern="yy.MM.dd" /></td>
				</tr>
			</c:forEach>
		</table>


		<br>
		<table border=1 id="mentor_det3">
		<span class="large_jh" id="spanBox"> 경력 </span>
			<tr align="center">
				<td style="background-color: #f3f3f3;">회사</td>
				<td style="background-color: #f3f3f3;">업무</td>
				<td style="background-color: #f3f3f3;">입사일</td>
				<td style="background-color: #f3f3f3;">퇴사일</td>
			</tr>
			<c:forEach var="career" items="${career }">
				<tr align="center">
					<td>${career.company }</td>
					<td>${career.task }</td>
					<td><fmt:formatDate value="${career.e_date }"
							pattern="yy.MM.dd" /></td>
					<td><fmt:formatDate value="${career.departure_date }"
							pattern="yy.MM.dd" /></td>
				</tr>
			</c:forEach>
		</table>

		<br>
		<table border=1 id="mentor_det3">
		<span class="large_jh" id="spanBox"> 자격증 </span>
			<tr align="center">
				<td style="background-color: #f3f3f3;">종류</td>
				<td style="background-color: #f3f3f3;">자격증</td>
				<td style="background-color: #f3f3f3;">취득일</td>
			</tr>
			<c:forEach var="license" items="${license }">
				<tr align="center">
					<td>${license.kind }</td>
					<td>${license.license_name }</td>
					<td><fmt:formatDate value="${license.issuing_date }"
							pattern="yy.MM.dd"></fmt:formatDate></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<table border=1 id="mentor_det3">
		<span class="large_jh" id="spanBox"> 멘토링 </span>
			<tr align="center">
				<td style="background-color: #f3f3f3;">멘토링 종류</td>
				<td style="background-color: #f3f3f3;">멘토링 요금</td>
			</tr>
			<c:forEach var="service" items="${service }">
				<tr align="center">
					<td>${service.mentoring_kind }</td>
					<td>${service.mentoring_fee }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<table border=1 id="mentor_det3">
		<span class="large_jh" id="spanBox"> 멘토링 상세 내역 </span>
			<tr align="center">
				<td style="background-color: #f3f3f3;">기술</td>
				<td style="background-color: #f3f3f3;">멘토링 장소</td>
				<td style="background-color: #f3f3f3;">멘토링 시간</td>
				<td style="background-color: #f3f3f3;">불가능한 요일</td>
			</tr>
			<tr align="center">
				<td>${mentor.technology }</td>
				<td>${mentor.mentoring_location }</td>
				<td>${mentor.mentoring_time }</td>
				<td>${mentor.unable_date }</td>
			</tr>
		</table>
		<br>

		<table border=1 id="mentor_det3">
		<span class="large_jh" id="spanBox"> 기타 </span>
			<tr align="center">
				<td style="background-color: #f3f3f3;">후기수</td>
				<td style="background-color: #f3f3f3;">평점</td>
				<td style="background-color: #f3f3f3;">신고수</td>
			</tr>
			<tr align="center">
				<td>${review}</td>
				<td>${reviewAVG}</td>
				<td>${report}</td>
			</tr>
		</table>
		<br>

		<div class="btnBox" align="center">
			<form action="masterSendMailForm">
				<input type="hidden" name="member_no" value="${mentor.member_no }"> <br> <input
					type="submit" value="메일" class="mailBtn" />
			</form>

			<br> <input type="submit" value="목록" class="listBtn"
				onClick="history.go(-1)" />

			<form action="memberDelete">
				<input type="hidden" name="member_no" value="${mentor.member_no }"> <br> <br> <input
					type="submit" value="탈퇴" class="delBtn" />
			</form>
		</div>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>

</body>
</html>

