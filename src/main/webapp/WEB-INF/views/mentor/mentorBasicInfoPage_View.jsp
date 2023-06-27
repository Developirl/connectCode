<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 프로필 사진 설정 -->
<div class="cont_mar">
	<div class="infoTitle">프로필 사진</div>
	<div class="mentor_info" style="padding: 0px 50px;">
		<div class="mentoProfileBox uplode_pro" style="margin-top: 20px; margin-bottom: 20px;">
			<c:if test="${empty msel.physical_name}">
				<img class="mentoProfile" src="/public/img/profile_img.png">
			</c:if>
			<c:if test="${!empty msel.physical_name}">
				<img class="mentoProfile" src="/download/${msel.physical_name}">
			</c:if>
		</div>
	</div>
</div>
<hr class="title_hr">

<!-- 소개글 설정 -->
<div class="cont_mar">
	<div class="infoTitle">소개글</div>
	<textarea class="mentor_info" rows="1" cols="120" style="width: 100%; padding:0px; resize: none;" disabled>${msel.intro}</textarea>
</div>
<hr class="title_hr">

<!-- 예약 시간 설정 -->
<div class="cont_mar">
	<div class="infoTitle">예약 가능한 시간</div>
	<div class="infoTitle mentor_info" style="display: flex;">
		<div style="width: 50%;">
		<div style="margin-bottom: 10px;">상담 불가능한 요일</div>
			<div id="date"></div>
		</div>
		<div style="width: 50%;">
		<div style="margin-bottom: 10px;">상담 가능한 시간</div>
			<div id="time"></div>
		</div>
	</div>
</div>
<hr class="title_hr">

<!-- 수정 btn -->
<div align="center" class="cont_mar">
	<!-- 최종 승인 요청 후에는 관리자가 승인하기 전까지 수정 불가하게 막기 -->
	<c:if test="${msel.classification != 22}">
		<button class="custom_btn" id="edit_btn" type="button" style="width: 200px;">수정하기</button>
	</c:if>
</div>

<script>

</script>
