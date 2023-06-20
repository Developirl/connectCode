<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

	<script>
		// 문의 작성 폼
		function ask(){
			location.href="mentorInqueryFormPage";
		}
	
	    // 검색 함수
		function inquery(){
			location.href="mentorInqueryListPage?search="+$("#search").val();
		}
		
	    //	select 함수
		$(function(){   	
		    $("#search option[value='${search}']").attr("selected", true);  	
		});
	
	</script>


	<div class="w3-container">
		<div class="fixedTop_div"></div>
		<font class="large_jh"> 1:1 문의 </font>
		<hr class="title_hr">
		<!-- CONTENT -->
		
		<!-- 검색 -->
		<div align="right" class="cont_mar">
			<!-- SELECT 1 -->
			<input type="button" class="search_sel small_jh" style="width: 120px;" onClick="ask()" value="문의하기" readOnly>
			&nbsp;&nbsp;
			<select class="search_sel small_jh" style="width: 120px;" id="search" name="search" onChange="inquery()">
				<option value="">문의 진행 상태</option>
				<option value="start">문의 진행중</option>
				<option value="end">처리 완료</option>
			</select>
			<!--  INPUT
			<span style="position: relative;">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="bi bi-search search_icon" viewBox="0 0 16 16">
				<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
				<input class="search small_jh" type="text" placeholder="검색어를 입력하세요."/>
			</span>
		</div>
		검색 end -->
		<hr class="title_hr">
		
		<!-- TITLE -->
		<!-- <div class="list_mar">
			<div class="medium_jh flex-txtAlign">
				<div class="list_div">번호</div>
				<div class="list_div">멘티이름</div>
				<div class="list_div">상담종류</div>
				<div class="list_div">신청일자</div>
				<div class="list_div">상담일자</div>
				<div class="list_div">회차</div>
				<div class="list_div">상태</div>
			</div>
		</div> -->
		
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
		
		<hr class="title_hr">
		
		<c:forEach var="b" items="${inqueryList}">
		<div class="list_mar">
			<!-- 멘토링예약 list -->
			<div class="accepted_list" onclick="">
				<div class="small_jh flex-txtAlign">
					
					<div class="list_div">${b.post_no}</div>
					<div class="list_div"></div>
					<div class="list_div">일대일 문의입니다</div>
					<div class="list_div"></div>
					<div class="list_div">${b.reg_date}</div>
					<div class="list_div"></div>
					<c:choose>
					  <c:when test="${b.reply_yn == 'N'}">
					    <div class="list_div" style="color: black; font-weight: bold;">문의 진행중</div>
					  </c:when>
					  <c:otherwise>
					    <div class="list_div" style="color: red; font-weight: bold;">처리완료</div>
					  </c:otherwise>
					</c:choose>
				</div>
			</div>
			</div>
			</c:forEach>
			<!-- 멘토링예약 list end -->
			
			<!-- 여기서부터 
			<div class="accepted_list" onclick="">
				<div class="small_jh flex-txtAlign">
					<div class="list_div">2</div>
					<div class="list_div">예시</div>
					<div class="list_div">대면상담</div>
					<div class="list_div">2023-06-08</div>
					<div class="list_div">2023-06-10</div>
					<div class="list_div">3</div>
					<div class="list_div">예약취소</div>
				</div>
			</div>
			 여기서까지는 삭제 (예시로 보여주기용였움) -->
			
		</div>
		
		<!-- 주석 풀어서 사용 /// c:if 써서 예약된 상담 empty 일때 보여지도록 (페이지 버튼은 가려지게 하기~) -->
		<c:if test="${empty inqueryList}">
		<div class="cont_mar">
			<div align="center" class="large_jh" style="margin-top: 20px;">
				<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16">
				  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				  <path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
				</svg>
				<br><br>아직 예약된
				<br>상담이 없습니다.
			</div>
		</div> 
		</c:if>
		
		<hr class="title_hr">
		
		<!-- 페이지 버튼 css는 페이징 처리 하는 사람들이랑 맞추기 -->
		<ul class="pagination justify-content-center">
			<!-- select 했을 경우의 페이징 처리 -->
			<c:if test="${not empty search}">
				<c:if test="${paging.startPage > paging.pageBlk }">
					<li class="page-item"><a class="page-link"
						href="mentorInqueryListPage?page=${paging.startPage - 1}&search=${search}" style="color: black;">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
					<li <c:if test="${paging.currentPage==i}">class="active"</c:if>><a class="page-link" 
						href="mentorInqueryListPage?page=${i}&search=${search}" style="color: black;">${i}</a></li>
				</c:forEach>
				<c:if test="${paging.endPage < paging.totalPage}">
					<li class="page-item"><a class="page-link" 
						href="mentorInqueryListPage?page=${paging.endPage + 1}&search=${search}" style="color: black;" >다음</a></li>
				</c:if>
			</c:if>
			<!-- 전체목록 페이징 처리 -->
			<c:if test="${empty search}">
				<c:if test="${paging.startPage > paging.pageBlk }">
				<li class="page-item"><a class="page-link" href="mentorInqueryListPage?page=${paging.startPage - 1}" style="color: black;">이전</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<li <c:if test="${paging.currentPage==i}">class="active"</c:if>>
				<a class="page-link" style="color: black;" href="mentorInqueryListPage?page=${i}">${i}</a>
				</li>
				</c:forEach>
				
				<c:if test="${paging.endPage < paging.totalPage}">
				<li class="page-item"><a class="page-link" 
					href="mentorInqueryListPage?page=${paging.endPage + 1}" style="color: black;">다음</a></li>
				</c:if>
			</c:if>
		</ul>
	
	<!-- CONTENT end -->
	</div>

<%@ include file="../public/sidebar_footer.jsp" %>
