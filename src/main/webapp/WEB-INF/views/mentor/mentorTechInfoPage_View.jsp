<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="cont_mar">

	<div class="infoTitle">보유기술</div>
	
	<c:if test="${!empty msel.technology}">
		<!-- technology 출력 -->
		<div style="display: flex;">
			<c:forEach var="tL" items="${technologyList}">
				<div class="mentor_info infoInp width100" style="text-align: center;">${tL}</div>
			</c:forEach>
		</div>
	</c:if>
	
	<c:if test="${empty msel.technology}">
		<div class="infoTitle">
			<div class="mentor_info" style="text-align: center; color: gray;">입력한 정보 없음</div>
		</div>
	</c:if>
	
</div>
<hr class="title_hr">


<div class="cont_mar">

	<div class="infoTitle">자격증/수상내역</div>
	
	<c:if test="${!empty lic_sel}">
		<c:forEach var="lic_sel" items="${lic_sel}">
			<div class="infoTitle">
				<div style="display: flex;">
					<div class="mentor_info infoCtg">항목</div>
					<div class="mentor_info infoInp">${lic_sel.kind}</div>
				</div>
				<div style="display: flex;">
					<div class="mentor_info infoCtg">자격증명</div>
					<div class="mentor_info infoInp">${lic_sel.license_name}</div>
				</div>
				<div style="display: flex;">
					<div class="mentor_info infoCtg">발행처/기관명</div>
					<div class="mentor_info infoInp">${lic_sel.issuing_authority}</div>
				</div>
				<div style="display: flex;">
					<div class="mentor_info infoCtg">취득일</div>
					<div class="mentor_info infoInp"><fmt:formatDate value="${lic_sel.i_date}" pattern="yyyy년 MM월 dd일"/></div>
				</div>
			</div>
		</c:forEach>
		
		<div style="display: flex;">
			<div class="mentor_info infoCtg">첨부파일</div>
			<div class="mentor_info infoInp"></div>
		</div>
	</c:if>
	
	<c:if test="${empty lic_sel}">
		<div class="infoTitle">
			<div class="mentor_info" style="text-align: center; color: gray;">입력한 정보 없음</div>
		</div>
	</c:if>
	
</div>

<hr class="title_hr">

<!-- 수정 btn -->
<div align="center" class="cont_mar">
	<c:if test="${msel.classification != 22}">
		<button class="custom_btn submit" id="edit_btn" type="button" style="width: 200px;">수정하기</button>
	</c:if>
</div>

