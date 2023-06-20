<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

	<div class="w3-container">
		<div class="fixedTop_div"></div>
		<font class="large_jh">대시보드</font>
		<hr class="title_hr">
		<!-- CONTENT -->
		
		<!-- 프로필 [미작성] 상태인 멘토 -->
		<c:if test="${msel.classification == 21}">
			<div class="large_jh" style="margin: 50px 100px;">
			<svg xmlns="http://www.w3.org/2000/svg" style="margin-bottom: 20px;" width="30" height="30" fill="currentColor" class="bi bi-quote" viewBox="0 0 16 16">
			  <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 9 7.558V11a1 1 0 0 0 1 1h2Zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 3 7.558V11a1 1 0 0 0 1 1h2Z"/>
			</svg>
				${msel.name} 멘토님은<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재 가입 대기 상태입니다.
			<svg xmlns="http://www.w3.org/2000/svg" style="transform: scaleX(-1); margin-bottom: 20px;" width="30" height="30" fill="currentColor" class="bi bi-quote" viewBox="0 0 16 16">
			  <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 9 7.558V11a1 1 0 0 0 1 1h2Zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 3 7.558V11a1 1 0 0 0 1 1h2Z"/>
			</svg>
			</div>
			<div class="medium_jh cont_mar" style="color:gray; background-color: white; padding: 20px;">
				가입 신청이 완료되었습니다.<br>
				운영팅에서 증빙서류 검토 후 승인되면 최종 가입 승인 됩니다.
			</div>
			<hr class="title_hr">
			<div class="cont_mar">
				<div class="medium_jh">프로필 입력</div>
				<div class="small_jh">필수 프로필을 입력하세요. 프로필을 입력하셔야 멘토링 활동이 가능합니다.</div>
				<div>
				<a href="mentorProfileModifyPage" class="profileEdit_a" style="margin-left: 88%;">작성하러 가기
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"/>
					</svg>
				</a>
				</div>
			</div>
			<hr class="title_hr">
		</c:if>
		
		<!-- 프로필 [작성완료] 상태인 멘토 -->
		<c:if test="${msel.classification != 21}">
			<div class="large_jh cont_mar">
			<svg xmlns="http://www.w3.org/2000/svg" style="margin-bottom: 20px;" width="30" height="30" fill="currentColor" class="bi bi-quote" viewBox="0 0 16 16">
			  <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 9 7.558V11a1 1 0 0 0 1 1h2Zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 3 7.558V11a1 1 0 0 0 1 1h2Z"/>
			</svg>
				${msel.name} 멘토님,&nbsp;&nbsp;안녕하세요!
			<svg xmlns="http://www.w3.org/2000/svg" style="transform: scaleX(-1); margin-bottom: 20px;" width="30" height="30" fill="currentColor" class="bi bi-quote" viewBox="0 0 16 16">
			  <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 9 7.558V11a1 1 0 0 0 1 1h2Zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 3 7.558V11a1 1 0 0 0 1 1h2Z"/>
			</svg>
			</div>
			<hr class="title_hr">
			<div class="cont_mar">
				<div class="medium_jh">최근 1개월 주요 활동수치</div>
				<div style="display: flex; margin-top: 20px;">
					<div align="center" class="medium_jh" style="width: 50%;">
						<a href="#" style="font-size: 30pt;">000</a>
						<br>멘토링 횟수
					</div>
					<div align="center" class="medium_jh" style="width: 50%;">
						<a href="#" style="font-size: 30pt;">000</a>
						<br>후기수
					</div>
				</div>
			</div>
			<hr class="title_hr">
			<div class="cont_mar">
				<div class="medium_jh">예약된 상담</div>
				<div align="center" class="large_jh" style="margin-top: 20px;">
					<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16">
					  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					  <path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
					</svg>
					<br><br>아직 예약된
					<br>상담이 없습니다.
				</div>
			</div>
			<hr class="title_hr">
			<div align="center" class="small_jh">
				<span style="font-weight: bold; color: red;">[Tip]</span> 프로필을 작성하셔야 멘토링 활동을 시작할 수 있습니다!&nbsp;&nbsp;&nbsp;
				<a href="mentorProfileModifyPage" class="profileEdit_a">작성하러 가기
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"/>
					</svg>
				</a>
			</div>
		</c:if>
	<!-- CONTENT end -->
	</div>

<%@ include file="../public/sidebar_footer.jsp" %>
