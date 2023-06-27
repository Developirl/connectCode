<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<script>
	function mentorInqueryDelete(post_no, page, mentor_no){	
		var result = confirm("정말 삭제 하시겠습니까?");
		if(result){
			location.href="mentorInqueryDelete?post_no="+post_no+"&page="+page+"&mentor_no="+mentor_no;
		}
	}
	</script>

	<div class="w3-container">
		<div class="fixedTop_div"></div>
		<div class="large_jh"> 1:1 문의 </div>
		<hr class="title_hr infoTitle">
		<!-- CONTENT -->
		
		
		<!-- TITLE -->
		<div class="medium_jh" align="center">
			<div class="cont_mar" style="display: flex;">
				<div class="mentor_info infoCtg" style="width: 10%;">제목</div>
				<div class="mentor_info infoCtg" style="width: 40%; text-align: left;">${mymentoring.title}</div>
				<div class="mentor_info infoCtg" style="width: 10%;">작성일</div>
				<div class="mentor_info infoCtg" style="width: 20%; text-align: left;"><fmt:formatDate value="${mymentoring.reg_date}" pattern="yyyy-MM-dd"/></div>
				<div class="mentor_info infoCtg" style="width: 10%;">처리상태</div>
				<div class="mentor_info infoInp" style="width: 20%; text-align: left;">
					<c:if test="${mymentoring.reply_yn == 'N'}">문의 진행중</c:if>
					<c:if test="${mymentoring.reply_yn == 'Y'}">답변 완료</c:if>
				</div>
			</div>
			<div class="cont_mar">
				<div class="mentor_info">내용</div>
				<div class="mentor_info" style="height: 400px;">${mymentoring.content}</div>
			</div>
		</div>

		<c:forEach var="inqueryReply" items="${inqueryReply}">
		<div class="list_mar">
			<!-- 멘토링예약 list -->
			<div class="accepted_list">
				<div class="small_jh flex-txtAlign">
					
					<div class="list_div">${inqueryReply.content}</div>
				</div>
			</div>
		</div>
		</c:forEach>
		
		<div align="center" class="cont_mar">
			<button onclick="location.href='mentorInqueryListPage?page=${page}&mentor_no=${msel.mentor_no}'" class="custom_btn" style="width: 100px;">목록</button>
			 
			<c:if test="${mymentoring.reply_yn == 'N'}">
				<button onclick="location.href='mentorInqueryUpdateForm?post_no=${mymentoring.post_no}&page=${page}&mentor_no=${msel.mentor_no}'" class="custom_btn" style="width: 100px;">수정</button> 
				<button onclick="mentorInqueryDelete('${mymentoring.post_no}','${page}',${msel.mentor_no})" class="custom_btn" style="width: 100px;">삭제</button> 
			</c:if>
		</div>
		<div id="list"></div>
			
	</div>
	<!-- CONTENT end -->

<%@ include file="../public/sidebar_footer.jsp" %>
