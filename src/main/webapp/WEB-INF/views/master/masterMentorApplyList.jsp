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
				<select name="search" id="search" class="search_sel small_jh" onchange="searchChange(this.value)" style="width: 120px; float: left;">
					<option value="all"<c:if test="${search='all' }">selected="selected"</c:if>>전체</option>
					<option value="wait"<c:if test="${search='wait' }">selected="selected"</c:if>>대기</option>
					<option value="apply"<c:if test="${search='apply' }">selected="selected"</c:if>>승인완료</option>
					<option value="refuse"<c:if test="${search='refuse' }">selected="selected"</c:if>>승인거부</option>
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
				<tbody align="center" id="changeCnt">
					<tr onClick="location.href='masterMentorApplyDetail?mentor_no=${mentor.mentor_no}&pageNum=${pageNum }'">
						<td><c:out value="${mentor.number }" /></td>
						<td>${mentor.name }</td>
						<td>${mentor.age }세</td>
						<td>${mentor.task }</td>
						<td>${mentor.years }년</td>
						<td>${mentor.apply_date }</td>
						<td>
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

		<!-- 목록 페이징 처리 -->
		<ul class="pagination justify-content-center">
		<!-- 검색 했을 때 페이징 처리 -->
			<c:if test="${not empty keyword}">
			<c:if test="${p.startPage > p.pageBlk}">
				<li class="page-item"><a class="page-link"
					href="masterMentorApplyList?pageNum=${p.startPage-1 }&keyword=${keyword}&search=${search}"
					style="color: black;">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
				<li class="page-item"<c:if test="${p.currentPage==i }">active</c:if>">
					<a class="page-link" href="masterMentorApplyList?pageNum=${i}&keyword=${keyword}&search=${search}"
					style="color: black;">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${p.endPage < p.totalPage }">
				<li class="page-item"><a class="page-link"
					href="masterMentorApplyList?pageNum=${p.endPage-1 }"
					style="color: black;">다음</a></li>
			</c:if>
		</c:if>
		<!-- 전체 목록의 페이징 처리 -->
		<c:if test="${empty keyword }">
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
					href="masterMentorApplyList?pageNum=${p.endPage-1 }&keyword=${keyword}&search=${search}"
					style="color: black;">다음</a></li>
			</c:if>
			</c:if>
		</ul>
	</div>

	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>