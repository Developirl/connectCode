<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<div class="cont_mar">
	<div style="display: flex;">
		<div class="mentor_info infoCtg">이름</div>
		<div class="mentor_info infoInp">${msel.name}</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">성별</div>
		<div class="mentor_info infoInp">
			<c:choose>
			    <c:when test="${msel.gender == 'male'}">남성</c:when>
			    <c:otherwise>여성</c:otherwise>
			 </c:choose>
		</div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">생년월일</div>
		<div class="mentor_info infoInp"><fmt:formatDate value="${msel.birthday}" pattern="yyyy년 MM월 dd일"/></div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">휴대폰번호</div>
		<div class="mentor_info infoInp" id="phoneNumber"></div>
	</div>
	<div style="display: flex;">
		<div class="mentor_info infoCtg">이메일</div>
		<div class="mentor_info infoInp">${msel.email}</div>
	</div>
</div>

<hr class="title_hr">

<!-- 수정 btn -->
<div align="center" class="cont_mar">
	<c:if test="${msel.classification != 22}">
		<button class="custom_btn" id="edit_btn" type="button" style="width: 200px;">수정하기</button>
	</c:if>
</div>
