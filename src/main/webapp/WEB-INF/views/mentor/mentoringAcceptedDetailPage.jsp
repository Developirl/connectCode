<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
$(document).ready(function(){
	
	$('.mentor_info').css('padding' , '10px');
	
	// 전화번호에 구분기호(-) 넣어서 화면단으로 출력
	var formattedPhoneNumber = '${accepted_detail.phone}'.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	$('#phoneNumber').append(formattedPhoneNumber);
	
	$("#accepted_cancel_reason").hide();
	
	$("#accepted_cancel").click(function(){		  // 예약취소 버튼 클릭
		$("#accepted_cancel_reason").show();				
	});
	
	$("form").submit(function(){				 //  확인 버튼 클릭
		
		if($("#cancel_reason").val() == ""){
			alert("취소 사유를 입력 하세요.");
			$("#cancel_reason").focus();
			return false;
		}			
	});
	

});

</script>	
	
<div class="infoTitle">
	<div align="center" class="medium_jh" style="margin-bottom: 20px;">
		${accepted_detail.name}
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">전화번호</div>
		<div class="small_jh mentor_info infoInp" id="phoneNumber"></div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">성별</div>
		<div class="small_jh mentor_info infoInp">
			<c:choose>
				<c:when test="${accepted_detail.gender == 'male'}">남성</c:when>
				<c:otherwise>여성</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">멘토링예약</div>
		<div class="small_jh mentor_info infoInp">${accepted_detail.mentoring_kind}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">직무</div>
		<div class="small_jh mentor_info infoInp">${accepted_detail.desired_job}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">멘토링지역</div>
		<div class="small_jh mentor_info infoInp">${accepted_detail.mentoring_location}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">질문</div>
		<div class="small_jh mentor_info infoInp">${accepted_detail.request_content}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">깃 주소</div>
		<div class="small_jh mentor_info infoInp">${accepted_detail.git}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">블로그 주소</div>
		<div class="small_jh mentor_info infoInp">${accepted_detail.blog}</div>
	</div>
</div>

<c:if test="${accepted_detail.classification == '32'}">
	<button class="btn btn-info" type="button" id="accepted_cancel">예약취소</button>
	<!-- 예약 취소 버튼 눌렀을 때, 취소사유 폼 뜨게해서 취소사유 작성하게 하기 -->
	<button class="btn btn-info" type="button" onClick="location.href='acceptedUpdate_ok?mentoring_no=${accepted_detail.mentoring_no}'">멘토링 완료</button>
</c:if>

<div id="accepted_cancel_reason">
	<form method="post" action="acceptedUpdate_no">
	    <input type="hidden" name="mentoring_no"  value="${accepted_detail.mentoring_no}">
		<input type=text name="cancel_reason" id="cancel_reason" placeholder="취소사유를 입력 하세요.">
		
		<input type="hidden" name="mentor_no" value="${msel.mentor_no}">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input class="btn btn-info" type=submit value="확인">
	</form>
</div>

<c:forEach var="acceptedCancel_reason" items="${acceptedCancel_reason}">
	<!-- 멘토링 취소사유 리스트 -->
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">취소사유</div>
		<div class="small_jh mentor_info infoInp">${acceptedCancel_reason.cancel_reason}</div>
	</div>
</c:forEach>

