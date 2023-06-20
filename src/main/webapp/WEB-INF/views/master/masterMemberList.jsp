<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_가입요청_리스트</title>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">회원관리</div>
	</nav>

	<div class="m_box">
		<!-- 검색 -->
		<form action="masterMemberList" method="post">
			<input type="hidden" name="pageNum" value="1">
			<div class="m_cont_mar">
				<!-- SELECT 1 -->
				<select name="search" class="search_sel small_jh"
					style="width: 120px; float: left;">
					<option value="">전체</option>
					<option value="">멘토</option>
					<option value="">멘티</option>
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
		
		<form action="masterSendMailForm">
		<table class="table table-hover" width="1050" align="center">
			<thead align="center">
				<tr>
					<th><input type="checkbox" id="allCheck"></th>
					<th>회원번호</th>
					<th>회원명</th>
					<th>회원구분</th>
<!-- 					<th>상태</th> -->
				</tr>
			</thead>
			<c:forEach var="TotalMember" items="${memberlist}">
			<tbody align="center">
				<tr>
<%-- 				<tr onClick="location.href='redirectToPage('${TotalMember.classification}', '${TotalMember_no}')'">
 --%>					<td><input type="checkbox" name="member_no" value="${TotalMember.member_no }"></td>
 					<td>${TotalMember.member_no}</td>
					<td>${TotalMember.name}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		
		<div align="right">
			<input type="submit" value="메일보내기">
		</div>
		</form>

		<!-- 전체 목록 페이징 처리 -->
		<ul class="pagination justify-content-center">
			<c:if test="${p.startPage > p.pageBlk}">
				<li class="page-item"><a class="page-link"
					href="masterMemberList?pageNum=${p.startPage-1 }"
					style="color: black;">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
				<li class="page-item"<c:if test="${p.currentPage==i }">active</c:if>">
			<a class="page-link" href="masterMemberList?pageNum=${i}"
							style="color: black;">${i}</a>
							</li>
			
						</c:forEach>

			<c:if test="${p.endPage < p.totalPage }">
				<li class="page-item"><a class="page-link"
					href="masterMemberList?pageNum=${p.endPage-1 }"
					style="color: black;">다음</a></li>
			</c:if>
		</ul>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>