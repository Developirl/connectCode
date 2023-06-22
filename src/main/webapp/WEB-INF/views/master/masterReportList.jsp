<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_신고관리</title>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">신고관리</div>
	</nav>

	<div class="m_box">
		<!-- 검색 -->
		<form action="masterReportList">
			<input type="hidden" name="pageNum" value="1">
			<div class="m_cont_mar">
				<!-- SELECT -->
				<select name="search" class="search_sel small_jh" style="width: 120px; float: left;">
					<option value="all">전체</option>
					<option value="mentor">처리</option>
					<option value="mentee">미처리</option>
				</select>
			</div>

			<!-- INPUT -->
			<div align="right">
				<span style="position: relative;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						class="bi bi-search search_icon" viewBox="0 0 16 16">
						<path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
						<input type="submit">
					</svg> <input name="keyword" class="search small_jh" type="text"
					placeholder="검색어를 입력하세요." />
				</span>
			</div>
		</form>
		<!-- 검색 end -->
		<br>

		<!-- 신고 미처리 -->
		<div class="unReportCont" id="unReportCont">
			<table class="table table-hover" width="1050" align="center">
				<thead align="center">
					<tr>
						<th>신고번호</th>
						<th>멘토ID</th>
						<th>멘티ID</th>
						<th>신고일자</th>
						<th>처리상태</th>
					</tr>
				</thead>

				<tbody align="center">
					<c:forEach var="reportList" items="${reportList }">
						<tr
							onClick="location.href='masterReportDetail?report_no=${reportList.report_no}&member_no=${reportList.member_no }&mentor_no=${reportList.mentor_no }'">
							<td>${reportList.report_no }</td>
							<td>${reportList.mentor_name }</td>
							<td>${reportList.mentee_name }</td>
							<td><fmt:formatDate value="${reportList.reg_date }"
									pattern="yy.MM.dd" /></td>
							<td><c:choose>
									<c:when test="${reportList.report_state == '36'}">환불</c:when>
									<c:when test="${reportList.report_state == '41'}">철회</c:when>
									<c:when test="${reportList.report_state == '42'}">멘토미처리</c:when>
									<c:when test="${reportList.report_state == '43'}">멘토처리</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<!-- 목록 페이징 처리 -->
		<ul class="pagination justify-content-center">
			<c:if test="${p.startPage > p.pageBlk}">
				<li class="page-item"><a class="page-link"
					href="masterReportList?pageNum=${p.startPage-1 }"
					style="color: black;">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
				<li class="page-item"<c:if test="${p.currentPage==i }">active</c:if>">
					<a class="page-link" href="masterReportList?pageNum=${i}"
					style="color: black;">${i}</a>
				</li>
			</c:forEach>

			<c:if test="${p.endPage < p.totalPage }">
				<li class="page-item"><a class="page-link"
					href="masterReportList?pageNum=${p.endPage-1 }"
					style="color: black;">다음</a></li>
			</c:if>
		</ul>
	</div>



	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>