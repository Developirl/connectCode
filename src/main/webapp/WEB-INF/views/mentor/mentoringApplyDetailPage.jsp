<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function mentorApplyUpdateOk(mentoring_no){	
		var result = confirm("정말 수락 하시겠습니까?");
		if(result){
			location.href="applyUpdate_ok?mentoring_no=" + mentoring_no;
		}
	}
	
	function mentorApplyUpdateNo(mentoring_no){	
		var result = confirm("정말 거절 하시겠습니까?");
		if(result){
			location.href="applyUpdate_no?mentoring_no=" + mentoring_no;
		}
	}
	
	$(document).ready(function(){
		$('.mentor_info').css('padding' , '10px');
		
		// 전화번호에 구분기호(-) 넣어서 화면단으로 출력
		var formattedPhoneNumber = '${apply_detail.phone}'.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		$('#phoneNumber').append(formattedPhoneNumber);
	});
	
</script>

<div class="infoTitle">
	<div align="center" class="medium_jh" style="margin-bottom: 20px;">
		${apply_detail.name}
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">전화번호</div>
		<div class="small_jh mentor_info infoInp" id="phoneNumber"></div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">성별</div>
		<div class="small_jh mentor_info infoInp">
			<c:choose>
				<c:when test="${apply_detail.gender == 'male'}">남성</c:when>
				<c:otherwise>여성</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">멘토링예약</div>
		<div class="small_jh mentor_info infoInp">${apply_detail.mentoring_kind}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">직무</div>
		<div class="small_jh mentor_info infoInp">${apply_detail.desired_job}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">멘토링지역</div>
		<div class="small_jh mentor_info infoInp">${apply_detail.mentoring_location}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">질문</div>
		<div class="small_jh mentor_info infoInp">${apply_detail.request_content}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">깃 주소</div>
		<div class="small_jh mentor_info infoInp">${apply_detail.git}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">블로그 주소</div>
		<div class="small_jh mentor_info infoInp">${apply_detail.blog}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">포트폴리오</div>
		<div class="small_jh mentor_info infoInp">
			<a href="download.do?fname=${physical_name}"> ${apply_detail.origin_name}</a>
		</div>
	</div>
</div>

<button class="btn btn-info" type="button"  onClick="mentorApplyUpdateOk('${apply_detail.mentoring_no}')" >수락</button>
<button class="btn btn-info" type="button" onClick="mentorApplyUpdateNo('${apply_detail.mentoring_no}')">거절</button>
<%-- <button class="btn btn-info" type="button"  onClick="location.href='applyUpdate_ok?mentoring_no=${apply_detail.mentoring_no}' " >수락</button>
<button class="btn btn-info" type="button" onClick="location.href='applyUpdate_no?mentoring_no=${apply_detail.mentoring_no}' ">거절</button> --%>
