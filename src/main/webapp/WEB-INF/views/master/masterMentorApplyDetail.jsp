<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_승인요청_상세</title>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">승인요청</div>
	</nav>

	<div class="m_box" align="center">
	<c:if test= "${ empty mentor.file_url }">
		<img src="/public/img/profile_img.png" id="mentor_profile" >
	</c:if>
	<c:if test = "${!empty mentor.file_url }" >
		<%-- <img src="${mentor.file_url }" id="mentor_profile" /> --%>
		<img src='<c:url value="filedownload?file_no=${mentor.file_no }&file_serial_number=${mentor.file_serial_number}&mentor_no=${mentor.mentor_no }&size=${mentor.size}"/>' id="mentor_profile">
	</c:if>

		<table border=1 id="mentor_det1">
			<tr align="center">
				<td style="background-color: #f3f3f3;">이름</td>
				<td style="background-color: #f3f3f3;">생년월일</td>
				<td style="background-color: #f3f3f3;">번호</td>
				<td style="background-color: #f3f3f3;">이메일</td>
			</tr>
			<tr align="center">
				<td>${mentor.name }</td>
				<td><fmt:formatDate value="${mentor.birthday }"
						pattern="yy.MM.dd" /></td>
				<td>${mentor.phone }</td>
				<td>${mentor.email }</td>
			</tr>
		</table>

		<br>
		<table border=1 id="mentor_det1">
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
		<table border=1 id="mentor_det2">
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
					<td><fmt:formatDate value="${career.d_date }"
							pattern="yy.MM.dd" /></td>
				</tr>
			</c:forEach>
		</table>

		<br>
		<table border=1 id="mentor_det2">
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
			<tr align="center">
				<td style="background-color: #d3d3d3;">멘토링 종류</td>
				<td style="background-color: #d3d3d3;">멘토링 요금</td>
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
			<tr align="center">
				<td style="background-color: #d3d3d3;">기술</td>
				<td style="background-color: #d3d3d3;">멘토링 장소</td>
				<td style="background-color: #d3d3d3;">멘토링 시간</td>
				<td style="background-color: #d3d3d3;">불가능한 요일</td>
			</tr>
			<tr align="center">
				<td>${mentor.technology }</td>
				<td>${mentor.mentoring_location }</td>
				<td>${mentor.mentoring_time }</td>
				<td>${mentor.unable_date }</td>
			</tr>
		</table>
		<br>

		<div class="intro_box">${mentor.intro }</div>
		<br>
		
		<div class="file-info" align="left">
		첨부파일:	<c:forEach var="file" items="${file_list }">
					<a href='<c:url value="filedownload?file_no=${file.file_no }&file_serial_number=${file.file_serial_number}&mentor_no=${mentor.mentor_no }&size=${file.size}"/>'>${file.origin_name }</a>
				<%-- <img src='<c:url value="filedownload?file_no=${file.file_no }&file_serial_number=${file.file_serial_number}&mentor_no=${mentor.mentor_no }&size=${file.size}"/>'></img> --%>
				</c:forEach>
				
<%-- 			<c:forEach var="career" items="${file_list }">
				<a href='<c:url value="filedownload?cfile_no=${career.file_no }&mentor_no=${mentor.mentor_no }"/>'>${career.origin_name }</a>
			</c:forEach>
			<c:forEach var="license" items="${file_list }">
				<a href='<c:url value="filedownload?lfile_no=${license.file_no }&mentor_no=${mentor.mentor_no }"/>'>${license.origin_name }</a>
			</c:forEach> --%>
		</div>

		<form action="mentorDetailApply">
			<br> <input type="hidden" name="mentor_no"
				value=${mentor.mentor_no }> <br> <br> <input
				type="submit" value="승인" class="appBtn" onClick="check1()"/>
		</form>

		<form action="mentorDetailRefuse">
			<input type="hidden" name="mentor_no" value=${mentor.mentor_no }>
			<br> <input type="submit" value="거부" class="refBtn" onClick="check2()"/>
		</form>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>
	<script>
		function check1(){
			alert("멘토 요청을 승인했습니다");
		}

		function check2(){
			alert("멘토 요청을 거부했습니다");
		}
	</script>

</body>
</html>

