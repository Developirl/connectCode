<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="cont_mar">

	<c:forEach var="edu_sel" items="${edu_sel}">
		<div class="infoTitle">
			<div style="display: flex;">
				<div class="mentor_info infoCtg">학교명</div>
				<div class="mentor_info infoInp">${edu_sel.school}</div>
			</div>
			<div style="display: flex;">
				<div class="mentor_info infoCtg">재학기간</div>
				<div class="mentor_info infoInp" id="entering_date">
					<fmt:formatDate value="${edu_sel.e_date}" pattern="yyyy년 MM월"/> ~ <fmt:formatDate value="${edu_sel.g_date}" pattern="yyyy년 MM월"/>
				</div>
			</div>
			<c:if test="${!empty edu_sel.degree}">
				<div style="display: flex;">
					<div class="mentor_info infoCtg">학위</div>
					<div class="mentor_info infoInp">${edu_sel.degree}</div>
				</div>
			</c:if>
			<div style="display: flex;">
				<div class="mentor_info infoCtg">전공명</div>
				<div class="mentor_info infoInp">${edu_sel.major}</div>
			</div>
			<c:if test="${!empty edu_sel.minor}">
				<div style="display: flex;">
					<div class="mentor_info infoCtg">부전공명</div>
					<div class="mentor_info infoInp">${edu_sel.minor}</div>
				</div>
			</c:if>
		</div>
	</c:forEach>
	
	<div style="display: flex;">
		<div class="mentor_info infoCtg">첨부파일</div>
		<div class="mentor_info infoInp"></div>
	</div>
</div>

<hr class="title_hr">

<!-- 수정 btn -->
<div align="center" class="cont_mar">
	<c:if test="${msel.classification != 22}">
		<button class="custom_btn submit" id="edit_btn" type="button" style="width: 200px;">수정하기</button>
	</c:if>
</div>
 
 
<script src="/mentor/datepicker/jquery-3.1.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
<script src="/mentor/datepicker/air-datepicker/dist/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="/mentor/datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->