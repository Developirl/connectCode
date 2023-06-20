<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<form action="masterInquireList">
			<input type="hidden" name="pageNum" value="1">
			<div class="m_cont_mar">
				<!-- SELECT 1 -->
				<select name="search" id="search" class="search_sel small_jh"
					style="width: 120px; float: left;">
					<option value="all">전체</option>
					<option value="apply">처리</option>
					<option value="refuse">미처리</option>
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
					<th>제목</th>
					<th>작성자</th>
					<th>회원구분</th>
					<th>작성일</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<c:forEach var="post" items="${postlist }">
				<tbody align="center">
					<tr
						onClick="location.href='masterInquireDetail?member_no=${post.member_no}&post_no=${post.post_no}'">
						<td>${post.ref_post_no }</td>
						<td>${post.title }</td>
						<td>${post.name }</td>
						<td>${post.member_no }</td>
						<td><fmt:formatDate value="${post.reg_date}"
								pattern="yy.MM.dd"></fmt:formatDate></td>
						<td class="reply-status">
						<c:choose>
							<c:when test="${post.reply_yn == 'Y'}">처리</c:when>
							<c:when test="${post.reply_yn == 'N'}">미처리</c:when>
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
					href="masterInquireList?pageNum=${p.endPage-1 }"
					style="color: black;">다음</a></li>
			</c:if>
		</ul>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>
	
	<!-- 글 정렬 script(답변대기, 답변완료) -->
<script>
    $(document).ready(function() {
        $("#search").change(function() {
            var selectedValue = $(this).val();
            var replyStatusElements = $(".reply-status");

            replyStatusElements.each(function() {
                var replyStatus = $(this).text().trim();
                var postRow = $(this).closest("tr");

                if (selectedValue === "all") {
                    postRow.show();
                } else if (selectedValue === "apply" && replyStatus === "처리") {
                    postRow.show();
                } else if (selectedValue === "refuse" && replyStatus === "미처리") {
                    postRow.show();
                } else {
                    postRow.hide();
                }
            });
        });

        $("#search").change();
    });
</script>

	</script>

</body>
</html>