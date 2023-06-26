<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

	<script>
		// 문의 작성 폼 이동
		function ask(mentor_no,member_no){
			location.href="mentorInqueryFormPage?mentor_no="+mentor_no+"&member_no="+member_no;
		}
	
	    // 검색 함수
		function inquery(){
			location.href="mentorInqueryListPage?search="+$("#search").val()+"&mentor_no="+${msel.mentor_no};
		}
		
	    //	select 함수
		$(function(){   	
		    $("#search option[value='${search}']").attr("selected", true);  	
		});
	
	    //	일대일 상세페이지 이동
	    function inqueryDetail(post_no, ref_post_no, page){
	    	location.href="mentorInqueryDetail?post_no="+post_no+"&page="+page+"&ref_post_no="+ref_post_no+"&mentor_no="+${msel.mentor_no};
	    }
	       
	</script>


	<div class="w3-container">
		<div class="fixedTop_div"></div>
		<font class="large_jh"> 1:1 문의 </font>
		<hr class="title_hr">
		<!-- CONTENT -->
		
		<!-- 검색 -->
		<div align="right" class="cont_mar">
			<!-- select -->
			<input type="button" class="search_sel small_jh" style="width: 120px;" onClick="ask(${msel.mentor_no},${msel.member_no})" value="문의하기" readOnly>
			&nbsp;&nbsp;
			<select class="search_sel small_jh" style="width: 120px;" id="search" name="search" onChange="inquery()">
				<option value="inlist">문의 진행 상태</option>
				<option value="start">문의 진행중</option>
				<option value="end">처리 완료</option>
			</select>
		<!-- 검색 end -->
		
		<hr class="title_hr">
		
		<!-- title -->
		<div class="list_mar">
			<div class="medium_jh flex-txtAlign">
				 &nbsp;&nbsp;
				<div class="list_div">번호</div>
				<div class="list_div"></div>
				<div class="list_div">제목</div>
				<div class="list_div"></div>
				<div class="list_div">작성일자</div>
				<div class="list_div"></div>
				<div class="list_div">상태</div> <!-- 신청 , 처리완료 -->
				&nbsp;&nbsp;
			</div>
		</div>
		<!-- title end -->
		
		<hr class="title_hr">
		
		<!-- 일대일 문의 list -->
		<c:set var="no" value="${no}"/>
		<c:forEach var="b" items="${inqueryList}">
		<div class="list_mar">
			<div class="accepted_list" onclick="inqueryDetail('${b.post_no}','${b.ref_post_no}','${page}')">
				<div class="small_jh flex-txtAlign">
					
					<div class="list_div">${no}</div>
					<c:set var="no" value="${no - 1}"/>	<!-- 삭제시 값 감소를 위한 -->
					<div class="list_div"></div>
					<div class="list_div">일대일 문의입니다</div>
					<div class="list_div"></div>
					<div class="list_div">${b.reg_date}</div>
					<div class="list_div"></div>
					 <c:if test="${b.reply_yn == 'N'}">
					    <div class="list_div" style="color: black; font-weight: bold;">문의 진행중</div>
					 </c:if>
					 <c:if test="${b.reply_yn == 'Y'}">
					    <div class="list_div" style="color: red; font-weight: bold;">처리완료</div>
					 </c:if>
				</div>
			</div>
		</div>
		</c:forEach>
		<!-- 일대일 문의 list end -->
		
		<!-- 일대일 문의 list가 empty값 일 때 -->
		<c:if test="${empty inqueryList}">
		<div class="cont_mar">
			<div align="center" class="large_jh" style="margin-top: 20px;">
				<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16">
				  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				  <path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
				</svg>
				<br><br>아직 일대일
				<br>문의가 없습니다.
			</div>
		</div> 
		</c:if>
		<!-- 일대일 문의 list가 empty값 일 때 end -->
		
		<hr class="title_hr">
		
		<!-- 페이징 처리  -->
		<ul class="pagination justify-content-center">
			<!-- select 했을 경우의 페이징 처리 -->
			<c:if test="${not empty search}">
				<c:if test="${paging.startPage > paging.pageBlk }">
					<li class="page-item"><a class="page-link"
						href="mentorInqueryListPage?page=${paging.startPage - 1}&search=${search}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
					<li <c:if test="${paging.currentPage==i}">class="active"</c:if>><a class="page-link" 
						href="mentorInqueryListPage?page=${i}&search=${search}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;">${i}</a></li>
				</c:forEach>
				<c:if test="${paging.endPage < paging.totalPage}">
					<li class="page-item"><a class="page-link" 
						href="mentorInqueryListPage?page=${paging.endPage + 1}&search=${search}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;" >다음</a></li>
				</c:if>
			</c:if>
			<!-- 전체목록 페이징 처리 -->
			<c:if test="${empty search}">
				<c:if test="${paging.startPage > paging.pageBlk }">
				<li class="page-item"><a class="page-link" href="mentorInqueryListPage?page=${paging.startPage - 1}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;">이전</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<li <c:if test="${paging.currentPage==i}">class="active"</c:if>>
				<a class="page-link" style="color: black;" href="mentorInqueryListPage?page=${i}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}">${i}</a>
				</li>
				</c:forEach>
				
				<c:if test="${paging.endPage < paging.totalPage}">
				<li class="page-item"><a class="page-link" 
					href="mentorInqueryListPage?page=${paging.endPage + 1}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;">다음</a></li>
				</c:if>
			</c:if>
		</ul>
		<!-- 페이징 처리 end -->
		
		<!-- CONTENT end -->
		</div>
	</div>

<%@ include file="../public/sidebar_footer.jsp" %>
