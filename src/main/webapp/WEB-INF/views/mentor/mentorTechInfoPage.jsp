<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post" action="mentorExpInfoPage_Up" id="myform" autocomplete="off" enctype="multipart/form-data">

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
				</div>
			</div>
		
		</div>
	</div>
	
	<!-- 추가하기 btn -->
	<div class="cont_mar" align="right" style="margin-top: 0px;">
		<button type="button" class="small_jh btn_jh plusLice_btn" style="background-color: black; color: #fff;">추가하기 +</button>
	</div>
	
	<!-- 파일 첨부 -->
	<div class="file_list cont_mar">
		<div class="file_input" style="margin-bottom: 10px;">
			<input type="file" name="files" onchange="selectFile(this);" accept=".jpg,.jpeg,.png,.docx,.pdf">
			<button type="button" class="small_jh btn_jh del_btn" style="margin: 0px;" onclick="removeFile(this);"><span>삭제</span></button>
			<button type="button" class="small_jh btn_jh add_btn" style="margin: 0px;" onclick="addFile();"><span>파일추가</span></button>
		</div>
	</div>
	
	<hr class="title_hr">
	
	<input type="hidden" name="mentor_no" value="${msel.mentor_no}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
	<!-- 요청 btn -->
	<div align="center" class="cont_mar">
		<input class="custom_btn submit" type="submit" value="요청하기" style="width: 200px;">
	</div>
	
	<c:if test="${msel.classification == 23}">
		<!-- 저장 btn -->
		<div align="center" class="cont_mar">
			<input class="custom_btn submit" type="submit" value="저장하기" style="width: 200px;">
		</div>
	</c:if>
	
 </form>
 
<script src="/mentor/datepicker/jquery-3.1.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
<script src="/mentor/datepicker/air-datepicker/dist/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="/mentor/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->