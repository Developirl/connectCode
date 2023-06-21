<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="cont_mar">
	<div class="infoTitle">
		<div style="display:flex;">
			<div style="width: 50%; text-align: center;">
				상담종류
			</div>
			<div style="width: 50%; text-align: center;">
				요금
			</div>
		</div>
	</div>
	
	<c:forEach var="ser_sel" items="${ser_sel}">
		<c:if test="${ser_sel.mentoring_fee != 0}">
			<div style="display:flex;">
				<div class="mentor_info infoCtg" style="width: 50%;">
					${ser_sel.mentoring_kind}
				</div>
				<div class="mentor_info infoCtg" style="width: 50%;">
					${ser_sel.mentoring_fee}
				</div>
			</div>
		</c:if>
	</c:forEach>
	
</div>
<hr class="title_hr">

<div class="cont_mar">
	<div class="infoTitle">정산계좌</div>
	<div class="infoTitle">
		<div style="display:flex;">
			<div class="mentor_info infoCtg" style="width: 30%;">
				<div style="margin-bottom: 5px;">은행명</div>
				<div style="color: gray;">${msel.bank}</div>
			</div>
			<div class="mentor_info infoCtg" style="width: 35%;">
				<div style="margin-bottom: 5px;">계좌번호</div>
				<div style="color: gray;">${msel.account}</div>
			</div>
			<div class="mentor_info infoCtg" style="width: 35%;">
				<div style="margin-bottom: 5px;">예금주명</div>
				<div style="color: gray;">${msel.account_name}</div>
			</div>
		</div>
	</div>
</div>
<hr class="title_hr">


<!-- 수정 btn -->
<div align="center" class="cont_mar">
	<c:if test="${msel.classification != 22}">
		<button class="custom_btn submit" id="edit_btn" type="button" style="width: 200px;">수정하기</button>
	</c:if>
</div>

