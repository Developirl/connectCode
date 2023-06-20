<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 승인 전,후 각각 div로 감싸서 show/hide로 하기? -->
<!-- 승인 전 화면 start -->
<div class="cont_mar mentor_info" style="color:gray; background-color: white; padding: 20px; text-align: center;">
		정확한 정보를 직접 입력한 후, [재직증명서] 등 증빙자료를 첨부해 주시기 바랍니다.<br>
		제출하신 자료는 운영팀에서 진위여부 확인 및 프로필 반영 후 즉시 삭제됩니다.
</div>	

<div class="cont_mar" id="plus_content" style="margin-bottom: 10px;">
	<div class="plus_div">
	
		<div style="display: flex;">
			<div class="mentor_info infoCtg">회사명  <span class="small_jh">[필수]</span></div>
			<div class="mentor_info infoInp">
				<input type="text" name="company" style="width: 100%;" value="" placeholder="회사명을 입력하세요.">
			</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">
				<div style="margin-top: 40px;">재직기간  <span class="small_jh">[필수]</span></div>
			</div>
			<div style="width: 60%;">
				<div style="display: flex;">
					<div class="mentor_info infoCtg">입사일자</div>
					<div class="mentor_info infoInp">
						<input type="text" class="datepicker-here width100" name="entering_date" readonly="readonly">
						<!-- <input type="text" class="PastDateDemo" name="entering_date" readonly="readonly"> -->
					</div>
				</div>
				<div style="display: flex;">
					<div class="mentor_info infoCtg">퇴사일자</div>
					<div class="mentor_info infoInp">
					   <input type="text" class="datepicker-here width100" name="departure_date" readonly="readonly">
						<!-- <input type="text" class="PastDateDemo" name="departure_date" readonly="readonly"> -->
					</div>
				</div>
			</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">직무  <span class="small_jh">[필수]</span></div>
			<div class="mentor_info infoInp">
				<select id="task" name="task" style="width: 50%; height: 30px;"></select>
			</div>
		</div>
		
	</div>
</div>

<!-- 추가하기 btn -->
<div class="cont_mar" align="right" style="margin-top: 0px;">
	<button type="button" class="small_jh btn_jh plus_btn" style="background-color: black; color: #fff;">추가하기 +</button>
</div>

<!-- 파일 첨부 -->
<div class="cont_mar" style="width: 70%; margin-top: 0px;">
	<input type="file" name="origin_name" accept=".jpg,.pdf">
</div>

<hr class="title_hr">

<!-- 수정/저장 btn -->
<div align="center" class="cont_mar">
	<button class="custom_btn submit" type="button" style="width: 200px;">수정하기</button>
	<!-- <input class="custom_btn submit" type="submit" value="저장하기" style="width: 200px;"> -->
</div>
<!-- 승인 전 화면 end -->

<!-- 
<!-- 승인 후 화면 start
<div class="cont_mar mentor_info" style="color:gray; background-color: white; padding: 20px; text-align: center;">
		정확한 정보를 직접 입력한 후, [재직증명서] 등 증빙자료를 첨부해 주시기 바랍니다.<br>
		제출하신 자료는 운영팀에서 진위여부 확인 및 프로필 반영 후 즉시 삭제됩니다.
</div>	

<div class="cont_mar">
	<div style="display: flex;">
		<div class="mentor_info infoCtg">회사명</div>
		<div class="mentor_info infoInp">(주)중앙정보</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">재직기간</div>
		<div class="mentor_info infoInp">2022년 12월 ~ [재직중]</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">직무</div>
		<div class="mentor_info infoInp">백엔드 (3년차)</div>
	</div>
	<div style="width: 70%; padding: 20px 0px;">
		<input type="file" accept=".jpg,.pdf">
	</div>
</div>

<hr class="title_hr">

수정/저장 btn
<div align="center" class="cont_mar">
	<button class="custom_btn submit" type="button" style="width: 200px;">수정하기</button>
	<!-- <input class="custom_btn submit" type="submit" value="저장하기" style="width: 200px;">
</div>

승인 후 화면 end
 -->
 
<!-- <script src="/mentor/js/MonthPicker.min.js"></script>
<script src="/mentor/js/examples.js"></script> -->

<script src="/mentor/datepicker/jquery-3.1.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
<script src="/mentor/datepicker/air-datepicker/dist/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="/mentor/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->