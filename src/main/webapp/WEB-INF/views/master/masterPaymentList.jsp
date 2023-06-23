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
		<div class="navbar-brand">결제관리</div>
	</nav>

	<div class="m_box">
		<!-- 검색 -->
		<form action="masterMentorApplyList">
			<input type="hidden" name="pageNum" value="1">
			<div class="m_cont_mar">
				<!-- SELECT 1 -->
				<select name="search" class="search_sel small_jh"
					style="width: 120px; float: left;">
					<option value="">전체</option>
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
					<th>결제정보번호</th>
					<th>결제멘토링</th>
					<th>상품/서비스이름</th>
					<th>결제금액</th>
					<th>결제수단</th>
					<th>결제상태</th>
					<th>결제일시</th>
				</tr>
			</thead>
			<tbody align="center">
			<c:forEach var="pay" items="${paylist}">
				<tr>
					<td>${pay.payment_no }</td>
					<td>${pay.mentoring_no }</td>
					<td>${pay.order_no }</td>
					<td>${pay.pay_amount }</td>
					<td>${pay.payment_method }</td>
					<td>${pay.pay_state }</td>
					<td>
						${pay.pay_time }
					</td>
				</tr>
			</c:forEach>

			</tbody>
		</table>

		<!-- 페이지 버튼 css는 페이징 처리 하는 사람들이랑 맞추기 -->
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				style="color: black;">이전</a></li>
			<li class="page-item"><a class="page-link" href="#"
				style="color: black;">1</a></li>
			<li class="page-item"><a class="page-link" href="#"
				style="color: black;">다음</a></li>
		</ul>
	</div>


	<%@ include file="../public/sidebar_footer.jsp"%>
</body>
</html>