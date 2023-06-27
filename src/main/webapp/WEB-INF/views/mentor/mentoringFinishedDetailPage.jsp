<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>

	$(document).ready(function(){
		$('.mentor_info').css('padding' , '10px');
		
		// 전화번호에 구분기호(-) 넣어서 화면단으로 출력
		var formattedPhoneNumber = '${finished_detail.phone}'.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		$('#phoneNumber').append(formattedPhoneNumber);
	});
	
</script>
	
<div class="infoTitle">
	<div align="center" class="medium_jh" style="margin-bottom: 20px;">
		${finished_detail.name}
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">전화번호</div>
		<div class="small_jh mentor_info infoInp" id="phoneNumber"></div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">성별</div>
		<div class="small_jh mentor_info infoInp">
			<c:choose>
				<c:when test="${finished_detail.gender == 'male'}">남성</c:when>
				<c:otherwise>여성</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">멘토링예약</div>
		<div class="small_jh mentor_info infoInp">${finished_detail.mentoring_kind}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">직무</div>
		<div class="small_jh mentor_info infoInp">${finished_detail.desired_job}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">멘토링지역</div>
		<div class="small_jh mentor_info infoInp">${finished_detail.mentoring_location}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">질문</div>
		<div class="small_jh mentor_info infoInp">${finished_detail.request_content}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">깃 주소</div>
		<div class="small_jh mentor_info infoInp">${finished_detail.git}</div>
	</div>
	<div style="display: flex;">
		<div class="small_jh mentor_info infoCtg">블로그 주소</div>
		<div class="small_jh mentor_info infoInp">${finished_detail.blog}</div>
	</div>
</div>

<c:if test="${!empty mentoringReview}">
	<div class="infoTitle">
		<div align="center" class="medium_jh" style="margin-bottom: 10px;">멘티 평가</div>
		<c:forEach var="mentoringReview" items="${mentoringReview}">
			<!-- 멘토링 리뷰 리스트 -->
			<div style="display: flex;">
				<div class="small_jh mentor_info infoCtg">평점</div>
			      
				<!-- 별 평점 ★★★★☆  forEach 시작 -->
				<div class="small_jh mentor_info infoInp">
					<c:forEach begin="1" end="${mentoringReview.rating}">
						<i class="bi bi-star-fill" style="color:#F2B661;font-size:14pt;"></i>
					</c:forEach>
					<c:forEach begin="${mentoringReview.rating}" end="4">
						<i class="bi bi-star" style="color:#F2B661;font-size:14pt;"></i>
					</c:forEach>
				</div>
	        	<!-- 별 평점 ★★★★☆  forEach 끝-->
				</div>
		        <!-- 리뷰 내용 -->
				<div style="display: flex;">
					<div class="small_jh mentor_info infoCtg">후기</div>
					<div class="small_jh mentor_info infoInp">${mentoringReview.content}</div>
				</div>
		</c:forEach>
	</div>
</c:if>