<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form method="post" <c:if test="${service_select_check == 'N'}">action="mentorServiceChar_Up_first"</c:if><c:if test="${service_select_check != 'N'}">action="mentorServiceChar_Up"</c:if> id="myform">

<!-- 승인 전,후 각각 div로 감싸서 show/hide로 하기? -->
<!-- 승인 전 화면 start -->
	<div id="test">
	</div>
	<div class="cont_mar">
		<div class="infoTitle">
			<div style="display:flex;">
				<div style="width: 50%; text-align: center;">
					상담종류  <span class="small_jh">[필수]</span>
				</div>
				<div style="width: 50%; text-align: center;">
					요금  <span class="small_jh">[필수]</span>
				</div>
			</div>
		</div>
		<div style="display:flex;">
			<div class="mentor_info infoCtg" style="width: 50%;">
				<input type="checkbox" id="call_mentoring" name="call_mentoring">&nbsp;20분 전화상담
			</div>
			<div class="mentor_info" style="width: 50%;">
				<div style="display: flex; text-align: center; padding: 0 10% 0 25%;">
					<input type="text" id="call_mentoring_fee" name="call_mentoring_fee" style="width: 70%; text-align: right;" placeholder="숫자만 입력하세요." readonly>
					<span style="width: 30%; text-align: left; padding-left: 10px;">원</span>
				</div>
			</div>
		</div>
		<div style="display:flex;">
			<div class="mentor_info infoCtg" style="width: 50%">
				<input type="checkbox" id="meet_mentoring" name="meet_mentoring">&nbsp;30분 대면상담
			</div>
			<div class="mentor_info" style="width: 50%;">
				<div style="display: flex; text-align: center; padding: 0 10% 0 25%;">
					<input type="text" id="meet_mentoring_fee" name="meet_mentoring_fee" style="width: 70%; text-align: right;" placeholder="숫자만 입력하세요." readonly>
					<span style="width: 30%; text-align: left; padding-left: 10px;">원</span>
				</div>
			</div>
		</div>
		<div class="small_jh" style="text-align: right; color: red;">* 1개 이상 선택</div>
		
	</div>
	<hr class="title_hr">
	
	<div class="cont_mar">
		<div class="infoTitle">정산계좌  <span class="small_jh">[필수]</span></div>
		<div class="infoTitle">
			<div style="display:flex;">
				<div class="mentor_info infoCtg" style="width: 30%;">
					<div style="margin-bottom: 5px;">은행명</div>
					<select class="width100" id="bank" name="bank" style="height: 30px;">
					</select>
				</div>
				<div class="mentor_info infoCtg" style="width: 35%;">
					<div style="margin-bottom: 5px;">계좌번호</div>
					<input type="text" class="width100" id="account" name="account" maxlength="30" value="${msel.account}" placeholder="'-'없이 숫자만 입력하세요.">
				</div>
				<div class="mentor_info infoCtg" style="width: 35%;">
					<div style="margin-bottom: 5px;">예금주명</div>
					<input type="text" class="width100" id="account_name" name="account_name" maxlength="5" value="${msel.account_name}" placeholder="한글만 입력하세요.">
				</div>
			</div>
		</div>
	</div>
	<hr class="title_hr">
	
	<input type="hidden" name="mentor_no" value="${msel.mentor_no}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
	<!-- 저장 btn -->
	<div align="center" class="cont_mar">
		<input class="custom_btn submit" type="submit" value="저장하기" style="width: 200px;">
	</div>

</form>


