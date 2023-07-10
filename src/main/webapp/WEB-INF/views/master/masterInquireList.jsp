<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_가입요청_리스트</title>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">문의요청</div>
	</nav>

	<div class="m_box">
		<!-- 검색 -->
		<form action="masterInquireList" id="searchForm"
			onsubmit="return check()">
			<input type="hidden" name="pageNum" value="1">
			<div class="m_cont_mar" style="float: left;">
				<!-- SELECT 1 -->
				<select name="search" id="search" class="search_sel small_jh"
					style="width: 120px; float: left; margin-left: 760px;">
					<option value="all">전체</option>
					<option value="apply">처리</option>
					<option value="refuse">미처리</option>
				</select>
			</div>

			<!-- INPUT -->
			<div align="right">
				<span style="position: relative;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						class="bi bi-search search_icon" id="searchIcon"
						viewBox="0 0 16 16">
				<path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
				</svg> <input id="keyword" name="keyword" class="search small_jh"
					type="text" placeholder="검색어를 입력하세요." />
				</span>
			</div>
		</form>
		<!-- 검색 end -->

		<!-- 검색 초기화 -->
		<c:if test="${not empty keyword}">
			<div class="searchCoRef">
				<a href="masterInquireList"
					style="text-decoration: none; color: #004EA2; font-weight: bold;">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" style="margin-bottom: 5px;"
						class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
							d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z" />
									<path
							d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z" />
								</svg>&nbsp;검색 초기화
				</a>
			</div>
		</c:if>
		<br>

		<table class="table table-hover" width="1050" align="center">
			<thead align="center">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>회원번호</th>
					<th>작성일</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<c:forEach var="post" items="${postlist }">
				<tbody align="center">
					<tr
						onClick="location.href='masterInquireDetail?member_no=${post.member_no}&post_no=${post.post_no}'">
						<td>${post.number }</td>
						<td>${post.title }</td>
						<td>${post.name }</td>
						<td>${post.member_no }</td>
						<td><fmt:formatDate value="${post.reg_date}"
								pattern="yy.MM.dd"></fmt:formatDate></td>
						<td class="reply-status"><c:choose>
								<c:when test="${post.reply_yn == 'Y'}">처리</c:when>
								<c:when test="${post.reply_yn == 'N'}">미처리</c:when>
							</c:choose></td>
					</tr>
				</tbody>
			</c:forEach>
			<c:if test="${empty postlist}">
				<tr align="center">
					<td colspan="6">검색결과가 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</table>

		<!-- 목록 페이징 처리 -->
		<ul class="pagination justify-content-center">
			<!-- 검색 했을 때 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${p.startPage > p.pageBlk}">
					<li class="page-item"><a class="page-link"
						href="masterInquireList?pageNum=${p.startPage-1 }&keyword=${keyword}&search=${search}"
						style="color: black;">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
					<li class="page-item"<c:if test="${p.currentPage==i }">active</c:if>">
						<a class="page-link"
						href="masterInquireList?pageNum=${i}&keyword=${keyword}&search=${search}"
						style="color: black;">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${p.endPage < p.totalPage }">
					<li class="page-item"><a class="page-link"
						href="masterInquireList?pageNum=${p.endPage+1 }"
						style="color: black;">다음</a></li>
				</c:if>
			</c:if>
			<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword }">
				<c:if test="${p.startPage > p.pageBlk}">
					<li class="page-item"><a class="page-link"
						href="masterInquireList?pageNum=${p.startPage-1 }"
						style="color: black;">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
					<li class="page-item"<c:if test="${p.currentPage==i }">active</c:if>">
						<a class="page-link" href="masterInquireList?pageNum=${i}"
						style="color: black;">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${p.endPage < p.totalPage }">
					<li class="page-item"><a class="page-link"
						href="masterInquireList?pageNum=${p.endPage+1 }&keyword=${keyword}&search=${search}"
						style="color: black;">다음</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>

</body>
</html>

<script>
	document.getElementById("searchIcon").addEventListener("click",
			function check() {
				if ($.trim($("#keyword").val()) == "") {
					alert("검색어를 입력하세요.");
					$("#keyword").focus();
					return false;
				}
				document.getElementById("searchForm").submit();
			});

	function check() {
		if ($.trim($("#keyword").val()) == "") {
			alert("검색어를 입력하세요.");
			$("#keyword").focus();
			return false;
		}
	}
</script>