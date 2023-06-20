<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<form method="post" action="mentorPersonInfo_UP" id="myform">

	<div class="cont_mar mentor_info" style="color:gray; background-color: white; padding: 20px; text-align: center;">
		<span style="color: #004EA2;">[회원가입]</span>
		할 때 입력한 데이터
		<span class="small_jh">(이름, 성별, 생년월일)</span>
		는 수정할 수 없습니다.
		<br>문제가 있을 경우, 1:1문의에 남겨주시면 운영팀에서 확인 후 처리해 드리겠습니다.
	</div>	
	
	<div class="cont_mar">
	
		<div style="display: flex;">
			<div class="mentor_info infoCtg">이름</div>
			<div class="mentor_info infoInp" style="color: gray;">${msel.name}</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">성별</div>
			<div class="mentor_info infoInp" style="color: gray;">
				<c:choose>
				    <c:when test="${msel.gender == 'male'}">남성</c:when>
				    <c:otherwise>여성</c:otherwise>
			 	</c:choose>
  			</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">생년월일</div>
			<div class="mentor_info infoInp" style="color: gray;"><fmt:formatDate value="${msel.birthday}" pattern="yyyy년 MM월 dd일"/></div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">휴대폰번호  <span class="small_jh">[선택]</span></div>
			<div class="mentor_info infoInp" style="width: 40%;" >
				<input type="text" id="phone" name="phone" style="width: 100%;" placeholder="'-'없이 숫자만 입력하세요." value="${msel.phone}">
			</div>
			<div class="mentor_info infoInp" style="width: 20%; text-align: right;">
				<button type="button" class="btn_jh" style="width: 100%;">인증하기</button>
			</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">이메일  <span class="small_jh">[선택]</span></div>
			<div class="mentor_info infoInp" style="display: flex;">
				<input type="text" id="email_id" value="${email[0]}" style="width: 35%;"><span style="margin-top: 10px;">&nbsp;@&nbsp;</span>
				<input type="text" id="domain" value="${email[1]}" style="width: 35%;" readonly><span style="margin-top: 10px;"></span>
				<select id="domain_sel" name="domain_sel" style="width: 30%; height: 38px; margin-left: 5px;"></select>
			</div>
		</div>
	</div>
	
	<hr class="title_hr">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
	<!-- 수정/저장 btn -->
	<div align="center" class="cont_mar">
		<input class="custom_btn submit" type="submit" value="저장하기" style="width: 200px;">
	</div>

</form>

<script>

$('#myform').submit(function(event){
	event.preventDefault(); // form 기본 동작 막기
	
// 유효성 검사 start
	var new_phone = $('#phone').val();
	var old_phone = '${msel.phone}'
	
	var new_email = $('#email_id').val() + '@' + $('#domain').val();
	var old_email = '${msel.email}'
	
	if(new_phone === old_phone){
		if (confirm('기존의 휴대폰번호와 동일한 번호로 저장합니다.')) {

		} else {
			alert('휴대폰 번호를 입력한 후 [인증하기] 버튼을 클릭하여 인증 후,\n[저장하기] 버튼을 클릭해주세요.')
			$('#phone').focus();
		    return;
		}
	}
		
	if(new_email === old_email){
		if(confirm('기존의 이메일과 동일한 이메일로 저장합니다.')) {

		} else {
			alert('변경할 메일 주소를 입력해주세요.')
			$('#email_id').focus();
		    return;
		}
	}
	
// 유효성 검사 end
	
	// hidden value에 var new_email 정의
	var email_hidden = $('<input>').attr({
		type : 'hidden',
		name : 'email',
		value : new_email
	});
	
	// 설정한 값으로 hidden 생성
	$('#myform').append(email_hidden);
	
	// form 통해서 전송할 데이터 직렬화
	$.post($(this).attr('action'), $(this).serialize(), function(response) {
	    // 페이지 새로고침
		$('#load_location').empty().html(response);
	
	}); 
	
}); // submit end

</script>
