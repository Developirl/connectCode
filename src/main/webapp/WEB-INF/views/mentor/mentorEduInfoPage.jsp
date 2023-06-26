<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form method="post" action="mentorEduInfo_Up" id="myform" enctype="multipart/form-data">

	<!-- 승인 전,후 각각 div로 감싸서 show/hide로 하기? -->
	<!-- 승인 전 화면 start -->
	<div class="cont_mar mentor_info" style="color:gray; background-color: white; padding: 20px; text-align: center;">
			정확한 정보를 직접 입력한 후, [졸업증명서] 등 증빙자료를 첨부해 주시기 바랍니다.<br>
			제출하신 자료는 운영팀에서 진위여부 확인 및 프로필 반영 후 즉시 삭제됩니다.
	</div>	
	
	<div class="cont_mar" id="plus_content" style="margin-bottom: 10px;">
	
		<c:if test="${!empty edu_sel}">
			<c:forEach var="edu_sel" items="${edu_sel}" varStatus="status">
				<div class="input_content" id="forDelete_content${status.index}" style="margin-bottom: 50px;">
				
					<div style="display: flex;">
						<div class="mentor_info infoCtg">학교명  <span class="small_jh">[필수]</span></div>
						<div class="mentor_info infoInp">
							<input type="text" id="school" name="school" style="width: 100%;" value="${edu_sel.school}" placeholder="학교명을 입력하세요.">
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
									<input type="text" class="datepicker-here entering_date${status.index} width100" id="entering_date" name="entering_date"
							       			data-min-view="months" data-view="months" data-date-format="yyyy-mm" readonly="readonly">
								</div>
							</div>
							<div style="display: flex;">
								<div class="mentor_info infoCtg">졸업일자</div>
								<div class="mentor_info infoInp">
									<input type="text" class="datepicker-here graduation_date${status.index} width100" id="graduation_date" name="graduation_date"
							       			data-min-view="months" data-view="months" data-date-format="yyyy-mm" readonly="readonly">
								</div>
							</div>
						</div>
					</div>
					<div style="display: flex;">
						<div class="mentor_info infoCtg" style="padding-top: 30px;">학위  <span class="small_jh">[선택]</span></div>
						<div class="mentor_info infoInp">
							<div class="small_jh" style="color: red;">* 대학교 이상의 경우 필수</div>
							<select class="degree${status.index}" name="degree" style="width: 50%; height: 50%; margin-top: 5px;">
								<option value="N">선택</option>
								<option value="학사">학사</option>
								<option value="석사">석사</option>
								<option value="박사">박사</option>
							</select>
						</div>
					</div>
					<div style="display: flex;">
						<div class="mentor_info infoCtg" style="padding-top: 30px;">전공명  <span class="small_jh">[필수]</span></div>
						<div class="mentor_info infoInp">
							<div class="small_jh" style="color: red;">* 최종 학력이 고등학교 졸업인 경우 '문과/이과' 입력</div>
							<input type="text" id="major" name="major" style="width: 100%; margin-top: 5px;" value="${edu_sel.major}" placeholder="전공명을 입력하세요.">
						</div>
					</div>
					<div style="display: flex;">
						<div class="mentor_info infoCtg">부전공명  <span class="small_jh">[선택]</span></div>
						<div class="mentor_info infoInp">
							<input type="text" class="minor" id="minor" name="minor" style="width: 100%;" <c:if test="${!empty edu_sel.minor}">value="${edu_sel.minor}"</c:if> placeholder="부전공명을 입력하세요.">
						</div>
					</div>
					<div align="right" style="margin-top: 10px;">
						<button type="button" class="small_jh btn_jh" id="delBtn" style="background-color: red; color: #fff;" onClick="delete_btn2(${status.index});">삭제하기</button>
					</div>
				</div>
				
				<script>

					$(document).ready(function(){
						
						// 사용자 입력 값 가져와서 selected 옵션 걸기
						$('.degree${status.index}').val('${edu_sel.degree}').prop("selected",true);
					
						// 사용자 입력 값 가져와서 입학일자/졸업일자 출력
						$('.entering_date${status.index}').val( "<fmt:formatDate value='${edu_sel.e_date}' pattern='yyyy-MM'/>" );
						$('.graduation_date${status.index}').val( "<fmt:formatDate value='${edu_sel.g_date}' pattern='yyyy-MM'/>" );
					});
					
				</script>
				
			</c:forEach>
		</c:if>
		<c:if test="${empty edu_sel}">
			<div class="plus_div">
			
				<div style="display: flex;">
					<div class="mentor_info infoCtg">학교명  <span class="small_jh">[필수]</span></div>
					<div class="mentor_info infoInp">
						<input type="text" id="school" name="school" style="width: 100%;" placeholder="학교명을 입력하세요.">
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
						<select class="degree" name="degree" style="width: 50%; height: 50%; margin-top: 5px;">
							<option value="N">선택</option>
							<option value="학사">학사</option>
							<option value="석사">석사</option>
							<option value="박사">박사</option>
						</select>
					</div>
				</div>
				<div style="display: flex;">
					<div class="mentor_info infoCtg" style="padding-top: 30px;">전공명  <span class="small_jh">[필수]</span></div>
					<div class="mentor_info infoInp">
						<div class="small_jh" style="color: red;">* 최종 학력이 고등학교 졸업인 경우 '문과/이과' 입력</div>
						<input type="text" id="major" name="major" style="width: 100%; margin-top: 5px;" placeholder="전공명을 입력하세요.">
					</div>
				</div>
				<div style="display: flex;">
					<div class="mentor_info infoCtg">부전공명  <span class="small_jh">[선택]</span></div>
					<div class="mentor_info infoInp">
						<input type="text" class="minor" id="minor" name="minor" style="width: 100%;" placeholder="부전공명을 입력하세요.">
					</div>
				</div>
			</div>
		</c:if>
	</div>
	
	<!-- 추가하기 btn -->
	<div class="cont_mar" align="right" style="margin-top: 0px;">
		<button type="button" class="small_jh btn_jh plus_btn" style="background-color: black; color: #fff;">추가하기 +</button>
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
	
	<!-- 저장 btn -->
	<div align="center" class="cont_mar">
		<input class="custom_btn submit" type="submit" value="저장하기" style="width: 200px;">
	</div>

</form>


<script src="/mentor/datepicker/jquery-3.1.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
<script src="/mentor/datepicker/air-datepicker/dist/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="/mentor/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->