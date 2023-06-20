<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form method="post" action="mentorBasicInfo_Up" id="myform" enctype="multipart/form-data">

	<div class="cont_mar">
		<div class="infoTitle">프로필 사진  <span class="small_jh">[선택]</span></div>
		<div class="mentor_info" style="padding: 0px 50px;">
			<div style="display:flex;">
				<div style="width: 70%; padding: 100px 0px;">
					<input type="file" id="origin_name" name="origin_name" accept=".jpg,.jpeg,.png">
				</div>
				<div style="width: 30%; margin-top: 20px;">
					<div class="mentoProfileBox uplode_pro">
						<img class="mentoProfile" id="preview" src="/public/img/profile_img.png">
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="title_hr">
	
	<!-- 소개글 설정 -->
	<div class="cont_mar">
		<div class="infoTitle">소개글  <span class="small_jh">[필수]</span></div>
		<div class="mentor_info" >
			<textarea id="intro" name="intro" rows="1" maxlength="25" style="width: 100%; padding:0px; resize: none;" placeholder="  25자 이내로 입력하세요.">${msel.intro}</textarea>
		</div>
	</div>
	<hr class="title_hr">
	
	<!-- 예약 시간 설정 -->
	<div class="cont_mar">
		<div class="infoTitle">예약 가능한 시간  <span class="small_jh">[필수]</span></div>
		<div class="infoTitle mentor_info" style="padding-bottom: 50px;">
			<div style="display: flex;">
				<div style="width: 50%;">
				<div style="margin-bottom: 10px;">상담 불가능한 요일</div>
					<div class="small_jh" style="color: red; margin: 0px 0px 10px 10px;">* 선택하지 않으면, 불가능한 요일이 없는 것으로 간주됨</div>
					<div id="date"></div>
				</div>
				<div style="width: 50%;">
				<div style="margin-bottom: 10px;">상담 가능한 시간</div>
					<div class="small_jh" style="color: red; margin: 0px 0px 10px 10px;">* 1개 이상 선택</div>
					<div id="time"></div>
				</div>
			</div>
		</div>
	</div>
	<hr class="title_hr">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
	<!-- 저장 btn -->
	<div align="center" class="cont_mar">
		<input class="custom_btn submit" id="submit" type="submit" value="저장하기" style="width: 200px;">
	</div>

</form>

<script>

</script>
