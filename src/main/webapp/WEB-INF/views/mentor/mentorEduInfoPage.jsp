<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form method="post" action="mentorEduInfo_UP" id="myform" autocomplete="off" enctype="multipart/form-data">

	<!-- 승인 전,후 각각 div로 감싸서 show/hide로 하기? -->
	<!-- 승인 전 화면 start -->
	<div class="cont_mar mentor_info" style="color:gray; background-color: white; padding: 20px; text-align: center;">
			정확한 정보를 직접 입력한 후, [졸업증명서] 등 증빙자료를 첨부해 주시기 바랍니다.<br>
			제출하신 자료는 운영팀에서 진위여부 확인 및 프로필 반영 후 즉시 삭제됩니다.
	</div>	
	
	<div class="cont_mar" id="plus_content" style="margin-bottom: 10px;">
		<div class="plus_div">
		
			<div style="display: flex;">
				<div class="mentor_info infoCtg">학교명  <span class="small_jh">[필수]</span></div>
				<div class="mentor_info infoInp">
					<input type="text" id="school" name="school" style="width: 100%;" value="" placeholder="학교명을 입력하세요.">
				</div>
			</div>
			<div style="display: flex;">
				<div class="mentor_info infoCtg">
					<div style="margin-top: 50px;">재학기간  <span class="small_jh">[필수]</span></div>
				</div>
				<div style="width: 60%;">
					<div style="display: flex;">
						<div class="mentor_info infoCtg">입학일자</div>
						<div class="mentor_info infoInp">
							<input type="text" class="datepicker-here width100" id="entering_date" name="entering_date"
					       			data-min-view="months" data-view="months" data-date-format="yyyy-mm" readonly="readonly">
						</div>
					</div>
					<div style="display: flex;">
						<div class="mentor_info infoCtg">졸업일자</div>
						<div class="mentor_info infoInp">
							<input type="text" class="datepicker-here width100" id="graduation_date" name="graduation_date"
					       			data-min-view="months" data-view="months" data-date-format="yyyy-mm" readonly="readonly">
						</div>
					</div>
				</div>
			</div>
			<div style="display: flex;">
				<div class="mentor_info infoCtg" style="padding-top: 30px;">학위  <span class="small_jh">[선택]</span></div>
				<div class="mentor_info infoInp">
					<div class="small_jh" style="color: red;">* 대학교 이상의 경우 필수</div>
					<select id="degree" name="degree" style="width: 50%; height: 50%; margin-top: 5px;"></select>
				</div>
			</div>
			<div style="display: flex;">
				<div class="mentor_info infoCtg" style="padding-top: 30px;">전공명  <span class="small_jh">[필수]</span></div>
				<div class="mentor_info infoInp">
					<div class="small_jh" style="color: red;">* 최종 학력이 고등학교 졸업인 경우 '문과/이과' 입력</div>
					<input type="text" id="major" name="major" style="width: 100%; margin-top: 5px;" value="" placeholder="전공명을 입력하세요.">
				</div>
			</div>
			<div style="display: flex;">
				<div class="mentor_info infoCtg">부전공명  <span class="small_jh">[선택]</span></div>
				<div class="mentor_info infoInp">
					<input type="text" id="minor" name="minor" style="width: 100%;" value="" placeholder="부전공명을 입력하세요.">
				</div>
			</div>
		</div>
		
	</div>
	
	<!-- 추가하기 btn -->
	<div class="cont_mar" align="right" style="margin-top: 0px;">
		<button type="button" class="small_jh btn_jh plus_btn" style="background-color: black; color: #fff;">추가하기 +</button>
	</div>
	
	<!-- 파일 첨부 -->
	<div class="file_list cont_mar" style="width: 70%; margin-top: 0px;">
		<div class="file_input">
			<input type="text" readonly="readonly">
			<label>
				<input type="file" name="files" onchange="selectFile(this);" accept=".jpg,.jpeg,.png,.docx,.pdf">
			</label>
		</div>
		<button type="button" class="small_jh btn_jh del_btn" onclick="removeFile(this);"><span>삭제</span></button>
		<button type="button" class="small_jh btn_jh add_btn" onclick="addFile();"><span>파일추가</span></button>
	</div>
	
	<hr class="title_hr">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<!-- 저장 btn -->
	<div align="center" class="cont_mar">
		<input class="custom_btn submit" type="submit" value="저장하기" style="width: 200px;">
	</div>
	<!-- 승인 전 화면 end -->

</form>


<!-- 
<!-- 승인 후 화면 start

<div class="cont_mar mentor_info" style="color:gray; background-color: white; padding: 20px; text-align: center;">
		정확한 정보를 직접 입력한 후, [졸업증명서] 등 증빙자료를 첨부해 주시기 바랍니다.<br>
		제출하신 자료는 운영팀에서 진위여부 확인 및 프로필 반영 후 즉시 삭제됩니다.
</div>	

<div class="cont_mar">
	<div style="display: flex;">
		<div class="mentor_info infoCtg">학교명</div>
		<div class="mentor_info infoInp">중앙정보대학교 신촌캠퍼스</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">재학기간</div>
		<div class="mentor_info infoInp">2022년 12월 ~ 2023년 07월</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">학위</div>
		<div class="mentor_info infoInp">학사</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">전공명 1</div>
		<div class="mentor_info infoInp">풀스텍과 (주전공)</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">전공명 2</div>
		<div class="mentor_info infoInp">백엔과 (부전공)</div>
	</div>
	<div style="width: 70%; padding: 20px 0px;">
		<input type="file" accept=".jpg,.pdf">
	</div>
</div>

<hr class="title_hr">

수정 btn
<div align="center" class="cont_mar">
	<button class="custom_btn submit" type="button" style="width: 200px;">수정하기</button>
</div>

승인 후 화면 end
 -->
 
<!-- <script src="/mentor/js/MonthPicker.min.js"></script>
<script src="/mentor/js/examples.js"></script> -->

<script src="/mentor/datepicker/jquery-3.1.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
<script src="/mentor/datepicker/air-datepicker/dist/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="/mentor/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->