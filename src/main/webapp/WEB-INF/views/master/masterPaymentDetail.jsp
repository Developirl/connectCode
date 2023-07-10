<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제관리</title>
</head>
<body>
	<%@ include file="../public/sidebar_hj.jsp"%>
	<nav class="navbar navbar-light">
		<div class="navbar-brand">결제관리</div>
	</nav>

	<div class="m_box2" align="center">
		<span class="large_jh" id="spanBox"> 구매자 정보 </span>
		<table border=1 id="mentee_det1">
			<tr align="center">
				<td style="background-color: #f3f3f3;">구매자</td>
				<td style="background-color: #f3f3f3;">핸드폰</td>
				<td style="background-color: #f3f3f3;">이메일</td>
			</tr>
			<tr align="center">
				<td>${payDetail.buyer_name }</td>
				<td>${payDetail.buyer_phone }</td>
				<td>${payDetail.buyer_email }</td>
			</tr>
		</table>
		<br> <span class="large_jh" id="spanBox"> 상세 정보 </span>
		<table border=1 id="mentee_det3">
			<tr align="center">
				<td style="background-color: #f3f3f3;">결제번호</td>
				<td style="background-color: #f3f3f3;">주문번호</td>
				<td style="background-color: #f3f3f3;">결제수단</td>
				<td style="background-color: #f3f3f3;">결제금액</td>
			</tr>
			<tr align="center">
				<td>${payDetail.payment_no }</td>
				<td>${payDetail.order_no }</td>
				<td>${payDetail.payment_method }</td>
				<td>${payDetail.pay_amount }</td>
			</tr>
			<tr align="center">
				<td style="background-color: #f3f3f3;" colspan=2>결제일</td>
				<td style="background-color: #f3f3f3;" colspan=2>환불일</td>
			</tr>
			<tr align="center">
				<td colspan=2>${payDetail.pay_time }</td>
				<td colspan=2>${payDetail.cancel_pay_time }</td>
			</tr>


		</table>
		<br> <span class="large_jh" id="spanBox"> 결제 멘토링 </span>
		<table border=1 id="mentee_det3">
			<tr align="center">
				<td style="background-color: #f3f3f3;">멘토링 번호</td>
				<td style="background-color: #f3f3f3;">멘토링 내용</td>
				<td style="background-color: #f3f3f3;">지역</td>
				<td style="background-color: #f3f3f3;">분류</td>
			</tr>
			<tr align="center">
				<td>${payDetail.mentoring_no }</td>
				<td>${payDetail.request_content }</td>
				<td>${payDetail.location }</td>
				<td>
			<c:choose>
				<c:when test="${payDetail.classification == 31}">결제완료</c:when>
				<c:when test="${payDetail.classification == 32}">상담예정</c:when>
				<c:when test="${payDetail.classification == 33}">상담거절</c:when>
				<c:when test="${payDetail.classification == 34}">예약취소</c:when>
				<c:when test="${payDetail.classification == 35}">상담완료</c:when>
				<c:when test="${payDetail.classification == 36}">환불완료</c:when>
			</c:choose>
				</td>
			</tr>
			<tr align="center">
				<td style="background-color: #f3f3f3;" colspan=2>신청일</td>
				<td style="background-color: #f3f3f3;" colspan=2>예약일</td>
			</tr>
			<tr align="center">
				<td colspan=2><fmt:formatDate value="${payDetail.apply_time }"
								pattern="yy.MM.dd HH:mm:ss"></fmt:formatDate></td>
				<td colspan=2><fmt:formatDate value="${payDetail.reserve_date }"
								pattern="yy.MM.dd HH:mm:ss"></fmt:formatDate></td>
			</tr>
		</table>
				<br>
				<br>
				<br> <input type="submit" value="목록" class="paylistBtn" onClick="history.go(-1)" />
	</div>
	

	<%@ include file="../public/sidebar_footer.jsp"%>

</body>
</html>

