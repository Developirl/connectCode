<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
$(document).ready(function(){
	
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
	
<div class="w3-container">
		<div class="fixedTop_div"></div>
		<font class="large_jh"> 예약 상세 페이지 </font>
		<hr class="title_hr">
		<!-- CONTENT -->
		
<div style="display: flex;">
	<div class="medium_jh" style="width: 50%; text-align: left;">${accepted_detail.name}</div>
	<div class="small_jh" style="width: 60%; text-align: right; color: #777777">[전화번호]&nbsp;${accepted_detail.phone}</div>
	<div class="small_jh" style="width: 40%;text-align: right; color: #777777">[성별]&nbsp;${accepted_detail.gender}</div>
</div>
<div>
<div class="small_jh">[멘토링예약]&nbsp;${accepted_detail.mentoring_kind}</div>
<div class="small_jh">[직무]&nbsp;${accepted_detail.desired_job}</div>
<div class="small_jh">[멘토링지역]&nbsp;${accepted_detail.mentoring_location}</div>
<div class="small_jh">[질문]&nbsp;${accepted_detail.request_content}</div>
<div class="small_jh" style="width: 60%; text-align: right;">[깃 주소]&nbsp;${accepted_detail.git}</div>
<div class="small_jh" style="width: 40%; text-align: right;">[블로그 주소]&nbsp;${accepted_detail.blog}</div>
</div>
<div style="display:flex;">
	<div class="small_jh">감자뿡</div>
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
	<div class="list_mar">
		<!-- 멘토링 취소사유 리스트 -->
		<div class="accepted_list">
			<div class="small_jh flex-txtAlign">		
				<div class="list_div">[취소사유]&nbsp;${acceptedCancel_reason.cancel_reason}</div>
			</div>
		</div>
	</div>
</c:forEach>

</div>
<tr>
<td>