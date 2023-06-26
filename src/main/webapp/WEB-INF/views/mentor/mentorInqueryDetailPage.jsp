<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

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
		<font class="large_jh"> 1:1 문의 </font>
		<hr class="title_hr">
		<!-- CONTENT -->
		
		<!-- 검색 -->
		<div align="right" class="cont_mar">
		
		<!-- TITLE -->
		<div class="container" align="center">
		<h2 class="text-primary">게시글 상세정보</h2>
		<div class="table table-bordered">
			<div>
				<div>제목</div>
				<div>${mymentoring.title}</div>
			</div>
			<div>
				<div>작성일</div>
				<div>${mymentoring.reg_date}</div>
			</div>
			<div>
				<div>처리상태</div>
				<div>${mymentoring.reply_yn}</div>
			</div>
			<div>
				<div>내용</div>
				<div>${mymentoring.content}</div>
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
				
		<a href="mentorInqueryListPage?page=${page}&mentor_no=${msel.mentor_no}" class="btn btn-info">목록</a>
		 
		<c:if test="${mymentoring.reply_yn == 'N'}">
			<a href="mentorInqueryUpdateForm?post_no=${mymentoring.post_no}&page=${page}&mentor_no=${msel.mentor_no}" class="btn btn-info">수정</a> 
			<a href="javascript:onClick=mentorInqueryDelete('${mymentoring.post_no}','${page}',${msel.mentor_no})" class="btn btn-info">삭제</a> 
		</c:if>
<%-- 		<a href="mentorInqueryDelete?post_no=${mymentoring.post_no}&page=${page}" class="btn btn-info">삭제</a>  --%>
		<div id="list"></div>
			
	</div>
	<!-- CONTENT end -->
	</div>
	</div>

<%@ include file="../public/sidebar_footer.jsp" %>
