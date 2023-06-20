<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_승인요청_리스트</title>

</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">승인요청</div>
	</nav>

	<div class="m_box">
		<!-- 검색 -->
		<form action="masterMentorApplyList">
			<input type="hidden" name="pageNum" value="1">
			<div class="m_cont_mar">
				<!-- SELECT 1 -->
				<select name="search" id="search" class="search_sel small_jh"
					style="width: 120px; float: left;">
					<option value="all">전체</option>
					<option value="wait">대기</option>
					<option value="apply">승인완료</option>
					<option value="refuse">승인거부</option>
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

		<table class="table table-hover" width="1050" align="center">
			<thead align="center">
				<tr>
					<th>번호</th>
					<th>신청자명</th>
					<th>나이</th>
					<th>분야</th>
					<th>경력</th>
					<th>신청일</th>
					<th>승인여부</th>
				</tr>
			</thead>

			<c:forEach var="mentor" items="${mentorlist}">
				<tbody align="center">
					<tr
						onClick="location.href='masterMentorApplyDetail?mentor_no=${mentor.mentor_no}&pageNum=${pageNum }'">
						<td><c:out value="${mentor.number }" /></td>
						<td>${mentor.name }</td>
						<td>${mentor.age }세</td>
						<td>${mentor.task }</td>
						<td>${mentor.years }년</td>
						<td>${mentor.apply_date }</td>
						<td class="reply-status">
						<c:choose>
								<c:when test="${mentor.classification == '22'}">대기</c:when>
								<c:when test="${mentor.classification == '23'}">승인완료</c:when>
								<c:when test="${mentor.classification == '24'}">승인거부</c:when>
						</c:choose>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>

		<!-- 전체 목록 페이징 처리 -->
		<ul class="pagination justify-content-center">
			<c:if test="${p.startPage > p.pageBlk}">
				<li class="page-item"><a class="page-link"
					href="masterMentorApplyList?pageNum=${p.startPage-1 }"
					style="color: black;">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
				<li class="page-item"<c:if test="${p.currentPage==i }">active</c:if>">
					<a class="page-link" href="masterMentorApplyList?pageNum=${i}"
					style="color: black;">${i}</a>
				</li>

			</c:forEach>

			<c:if test="${p.endPage < p.totalPage }">
				<li class="page-item"><a class="page-link"
					href="masterMentorApplyList?pageNum=${p.endPage-1 }"
					style="color: black;">다음</a></li>
			</c:if>
		</ul>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>
	<!-- 글 정렬 script(답변대기, 답변완료) -->
	<script>
		$(document)
				.ready(
						function() {
							$("#search")
									.change(
											function() {
												var selectedValue = $(this)
														.val();
												var replyStatusElements = $(".reply-status");

												replyStatusElements
														.each(function() {
															var replyStatus = $(
																	this)
																	.text()
																	.trim();
															var postRow = $(
																	this)
																	.closest(
																			"tr");

															if (selectedValue === "all") {
																postRow.show();
															} else if (selectedValue === "wait"
																	&& replyStatus
																			.indexOf("대기") !== -1) {
																postRow.show();
															} else if (selectedValue === "apply"
																	&& replyStatus
																			.indexOf("승인완료") !== -1) {
																postRow.show();
															} else if (selectedValue === "refuse"
																	&& replyStatus
																			.indexOf("승인거부") !== -1) {
																postRow.show();
															} else {
																postRow.hide();
															}
														});
											});

							$("#search").change();
						});
	</script>

</body>
</html>