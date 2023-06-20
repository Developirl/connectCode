<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
	<div class="js-mentorInfopage-outerbox">
	<div class="js-mentorinfo-title">멘토 정보</div>
	
		<div class="js-mentorinfo-align-left">
			<span class="js-mentorinfo-gray">멘토</span> &nbsp;&nbsp;
				<span class="js-mentorinfo-black">${mentor.name}</span><br>
			<span class="js-mentorinfo-gray">회사</span> &nbsp;&nbsp;
				<span class="js-mentorinfo-black">${mentor.company}</span><br>
			<span class="js-mentorinfo-gray">직무</span> &nbsp;&nbsp;
				<span class="js-mentorinfo-black">${mentor.task}</span><br>
		</div>
	
	</div>

	<div class="js-mentorInfopage-outerbox">
	<div class="js-mentorinfo-title">멘토링 정보</div>
		<div class="js-mentorinfo-align-left">
			<span class="js-mentorinfo-gray">
				<c:if test="${reserve_kind == '20분 전화 멘토링' }">
					<div class="js-mentorinfo-align-left">
						<span class="js-mentorinfo-gray">멘토링 종류</span> 
						<span class="js-mentorinfo-black">${reserve_kind}</span><br>
						<br>
						<span class="js-mentorinfo-gray">
						예약한 시간에 멘토가 직접 멘티에게 전화 멘토링을 진행합니다. <br>
						예약시 작성한 글과 포트폴리오 등의 파일을 멘토가 사전에 확인합니다. <br>
						멘토링 예약 및 멘토링 내용은 멘토의 비밀유지에 의해 보호됩니다. <br>
						</span>
					</div>
				</c:if>
		
		
				<c:if test="${reserve_kind == '30분 대면 멘토링' }">
					<div class="js-mentorinfo-align-left">
						<span class="js-mentorinfo-gray">멘토링 종류</span>&nbsp;&nbsp; 
						<span class="js-mentorinfo-black">${reserve_kind}</span><br>
						<br>
						<span class="js-mentorinfo-gray">
						예약 일자 이전에 만남 장소를 정하기 위해 멘토가 직접 멘티에게 연락을 드립니다. <br>
						멘토링 가능한 지역이 서로 일치하지 않을 경우 멘토는 멘토링을 취소할 수 있습니다. <br>
						( 멘토에 의하여 멘토링 취소시 전액 환불해드립니다. )<br>
						예약시 작성한 글과 포트폴리오 등의 파일을 멘토가 사전에 확인합니다. <br>
						멘토링 예약 및 멘토링 내용은 멘토의 비밀유지에 의해 보호됩니다. <br>
						</span>
					</div>
				</c:if>
			</span>	
		</div>	
	</div>


	<div class="js-mentorInfopage-outerbox">
	<div class="js-mentorinfo-title">예약취소 및 환불규정</div>
		<div class="js-mentorinfo-align-left">
		  ${reserve_kind }
			<c:if test="${reserve_kind == '20분 전화 멘토링' }">
				<span class="js-mentorinfo-gray">
				예약취소는 멘토링 1시간 전까지만 마이페이지에서 취소 가능하며, 이후에는 취소 및 환불이 불가능합니다. <br><br>
				멘토 사정으로 멘토링을 받지 못한 경우 100% 환불해드립니다. 1:1 문의 또는 후기 요청의 신고하기로 남겨주세요. <br><br>
				멘티 사정으로 멘토링을 하지 못한 경우 또는 멘토링이 미루어진 경우는 환불해드리지 않습니다.  
				</span>
			</c:if>	
			
			<c:if test="${reserve_kind == '30분 대면 멘토링' }">
				<span class="js-mentorinfo-gray">
				예약취소는 멘토링 3시간 전까지만 마이페이지에서 취소 가능하며, 이후에는 취소 및 환불이 불가능합니다. <br><br>
				멘토 사정으로 멘토링을 받지 못한 경우 100% 환불해드립니다. 1:1 문의 또는 후기 요청의 신고하기로 남겨주세요. <br><br>
				멘티 사정으로 멘토링을 하지 못한 경우 또는 멘토링이 미루어진 경우는 환불해드리지 않습니다.  
				</span>
			</c:if>	
			
		</div>
	</div>


