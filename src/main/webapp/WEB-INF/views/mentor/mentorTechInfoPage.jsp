<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 승인 전,후 각각 div로 감싸서 show/hide로 하기? -->
<!-- 승인 전 화면 start -->
<div class="cont_mar infoTitle" style="margin-bottom: 20px;">보유기술  <span class="small_jh">[선택]</span></div>
<div class="cont_mar" id="plusTech_content" style="margin-top: 0px; margin-bottom: 10px;">
	<div class="plus_div">
	
		<div style="display: flex;">
			<div class="mentor_info infoCtg">보유기술</div>
			<div class="mentor_info infoInp">
				<select id="technology" name="technology" style="width: 50%; height: 30px;"></select>
			</div>
		</div>
		
	</div>
</div>

<!-- 추가하기 btn -->
<div class="cont_mar" align="right" style="margin-top: 0px;">
	<button type="button" class="small_jh btn_jh plusTech_btn" style="background-color: black; color: #fff;">추가하기 +</button>
</div>

<hr class="title_hr">


<div class="cont_mar infoTitle" style="margin-bottom: 20px;">자격증/수상내역  <span class="small_jh">[선택]</span></div>
<div class="cont_mar" id="plusLice_content" style="margin-top: 0px; margin-bottom: 10px;">
	<div class="plus_div">
	
		<div style="display: flex;">
			<div class="mentor_info infoCtg">항목</div>
			<div class="mentor_info infoInp">
				<select id="kind" name="kind" style="width: 50%; height: 30px;"></select>
			</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">자격증/수상내역명</div>
			<div class="mentor_info infoInp">
				<input type="text" name="license_name" style="width: 100%;" value="" placeholder="자격증명을 입력하세요.">
			</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">발행처/기관명</div>
			<div class="mentor_info infoInp">
				<input type="text" name="issuing_authority" style="width: 100%;" value="" placeholder="발행기관을 입력하세요.">
			</div>
		</div>
		<div style="display: flex;">
			<div class="mentor_info infoCtg">취득일</div>
			<div class="mentor_info infoInp" >
				<input type="text" class="datepicker-here width100" name="issuing_date" readonly="readonly">
				<!-- <input type="date" name="issuing_date"> -->
			</div>
		</div>
	
	</div>
</div>

<!-- 추가하기 btn -->
<div class="cont_mar" align="right" style="margin-top: 0px;">
	<button type="button" class="small_jh btn_jh plusLice_btn" style="background-color: black; color: #fff;">추가하기 +</button>
</div>

<div class="cont_mar" style="width: 70%; padding: 20px 0px;">
	<input type="file" name="origin_name" accept=".jpg,.pdf">
</div>

<hr class="title_hr">

<!-- 수정/저장 btn -->
<div align="center" class="cont_mar">
	<input class="custom_btn submit" type="submit" value="저장하기" style="width: 200px;">
</div>
<!-- 승인 전 화면 end -->

<!-- 
<!-- 승인 후 화면 start
<div class="cont_mar">
	<div class="infoTitle">보유기술</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">Java</div>
		<div class="mentor_info infoCtg">Java Script</div>
		<div class="mentor_info infoCtg">Python</div>
	</div>
</div>
<hr class="title_hr">

<div class="cont_mar">
	<div class="infoTitle">자격증/수상내역</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">항목</div>
		<div class="mentor_info infoInp">자격증</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">자격증명</div>
		<div class="mentor_info infoInp">정보처리기사</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">발행처/기관명</div>
		<div class="mentor_info infoInp">국가기술자격증명원</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">취득일</div>
		<div class="mentor_info infoInp">2023년 06월 10일</div>
	</div>
	<!-- <div style="width: 70%; padding: 20px 0px;">
		<input type="file" accept=".jpg,.pdf">
	</div>
</div>

<hr class="title_hr">

수정/저장 btn
<div align="center" class="cont_mar">
	<button class="custom_btn submit" type="button" style="width: 200px;">수정하기</button>
</div>

승인 후 화면 end
 -->
 
<script src="/mentor/datepicker/jquery-3.1.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
<script src="/mentor/datepicker/air-datepicker/dist/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="/mentor/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->