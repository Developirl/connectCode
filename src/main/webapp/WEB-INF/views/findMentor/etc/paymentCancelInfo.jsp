<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
    
	<div class="js-mentorinfo-title">결제 정보</div>
	<div class="js-mentorInfopage-outerbox">
	
		<div class="js-mentorinfo-align-left">
			<table class="paymentCancelTable">
			<tr>
				<td>
				    <span class="js-mentorinfo-gray">주문번호</span> &nbsp;&nbsp;
				</td>
				<td>
					<span class="js-mentorinfo-black">${info.order_no}</span><br>
				</td>
			</tr>
			<tr>
				<td>
					<span class="js-mentorinfo-gray">구매자</span> &nbsp;&nbsp;
				</td>
				<td>
					<span class="js-mentorinfo-black">${info.buyer_name}</span><br>
				</td>
			</tr>
			<tr>
				<td>
					<span class="js-mentorinfo-gray">구매상품</span> &nbsp;&nbsp;
				</td>
				<td>
					<span class="js-mentorinfo-black">${info.mentoring_kind}</span><br>
				</td>
			</tr>
			<tr>
				<td>
					<span class="js-mentorinfo-gray">결제일시</span> &nbsp;&nbsp;
				</td>
				<td>
					<span class="js-mentorinfo-black">
					<fmt:formatDate value="${info.pay_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span><br>
				</td>
			</tr>
			<tr>
				<td>
					<span class="js-mentorinfo-gray">결제금액</span> &nbsp;&nbsp;
				</td>
				<td>
					<span class="js-mentorinfo-black">
					<fmt:formatNumber value="${info.pay_amount}" type="number" var="pay" />${pay} 원
					</span><br>
				</td>
			</tr>
			</table>
		</div>
	
	</div>

	
