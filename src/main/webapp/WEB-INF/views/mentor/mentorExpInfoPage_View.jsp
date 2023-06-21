<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="cont_mar mentor_info" style="color:gray; background-color: white; padding: 20px; text-align: center;">
		정확한 정보를 직접 입력한 후, [재직증명서] 등 증빙자료를 첨부해 주시기 바랍니다.<br>
		제출하신 자료는 운영팀에서 진위여부 확인 및 프로필 반영 후 즉시 삭제됩니다.
</div>	

<div class="cont_mar">

	<c:forEach var="car_sel" items="${car_sel}">
		<div style="display: flex;">
			<div class="mentor_info infoCtg">회사명</div>
			<div class="mentor_info infoInp">${car_sel.company}</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">재직기간</div>
			<div class="mentor_info infoInp">2022년 12월 ~ [재직중]</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">직무</div>
			<div class="mentor_info infoInp">${car_sel.task}</div>
		</div>
		<div style="width: 70%; padding: 20px 0px;">
			${edu_sel.origin_name}
		</div>
	</c:forEach>

</div>

<hr class="title_hr">

<!-- 수정 btn -->
<div align="center" class="cont_mar">
	<button class="custom_btn submit" id="edit_btn" type="button" style="width: 200px;">수정하기</button>
</div>
 
<script src="/mentor/datepicker/jquery-3.1.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
<script src="/mentor/datepicker/air-datepicker/dist/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="/mentor/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->