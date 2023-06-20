<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

<script>
		function accpted1(){
			location.href="mentoringAcceptedListPage?search="+$("#search").val();
		}
		
		$(function(){   	
		    $("#search option[value='${search}']").attr("selected", true);  	
		});
		
		function acceptsearch(){
			location.href="mentoringAcceptedListPage?acceptsearch="+$("#acceptsearch").val();
		}
		
		$(function(){   	
		    $("#acceptsearch option[value='${acceptsearch}']").attr("selected", true);  	
		});
	
	</script>

	<div class="w3-container">
		<div class="fixedTop_div"></div>
		<font class="large_jh">예약된 상담</font>
		<hr class="title_hr">
		<!-- CONTENT -->
		
		<!-- 검색 -->
		<div align="right" class="cont_mar">
			<!-- SELECT 1 -->
			<select class="search_sel small_jh" style="width: 120px;" id="acceptsearch" name="acceptsearch" onChange="acceptsearch()">
				<option value="applytime">신청일순</option>
				<option value="fast">빠른 상담순</option>
				<option value="later">나중 상담순??</option>
			</select>
			<!-- SELECT 2 -->
			<select class="search_sel small_jh" style="width: 120px;" id="search" name="search" onChange="accpted1()">
				<option value="all">모든상담</option>
				<option value="accept">예약확정</option>
				<option value="cancel">예약취소</option>
			</select>
			<!-- INPUT -->
			<div style="width: 20%; margin-left: 10px;">
              <form id="myform" action="mentoringAcceptedListPage">
                  <!-- INPUT -->
                  <span style="position: relative;">
                      <input type="text" class="search small_jh" name="keyword" style="width: 100%;" placeholder="검색어를 입력하세요."/>
                     <button type="submit" style="border: none;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" id="svg" class="bi bi-search search_icon"viewBox="0 0 16 16">
                           <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                     </button>
                  </span>
               </form>   
            </div>
		</div>
		<!-- 검색 end -->
		<hr class="title_hr">
		
		<!-- TITLE -->
		<div class="list_mar">
			<div class="medium_jh flex-txtAlign">
				<div class="list_div">번호</div>
				<div class="list_div">멘티이름</div>
				<div class="list_div">상담종류</div>
				<div class="list_div">신청일자</div>
				<div class="list_div">상담일자</div>
				<div class="list_div">회차</div>
				<div class="list_div">상태</div>
			</div>
		</div>
		<hr class="title_hr">
		
		<div class="list_mar">
			<!-- 멘토링예약 list -->
			<c:forEach var="b" items="${acceptedList}">
			<div class="accepted_list" onclick="">
				<div class="small_jh flex-txtAlign">
					<div class="list_div">${b.mentoring_no}</div>
					<div class="list_div">${b.name}</div>
					<div class="list_div">${b.mentoring_kind}</div>
					<div class="list_div">${b.apply_time }</div>
					<div class="list_div">${b.reserve_date }</div>
					<div class="list_div">1</div>	<!-- 멘토링 횟수 ( count(*)로 해야하나 ? -->
					  <c:if test="${b.classification == '31'}">
					    <div class="list_div" style="color: red; font-weight: bold;">예약완료</div>
					  </c:if>
					  <c:if test="${b.classification =='32'}">
					    <div class="list_div" style="color: black; font-weight: bold;">예약취소</div>
					  </c:if>
				</div>
			</div>
			</c:forEach>
			<!-- 멘토링예약 list end -->
			
			<!-- 여기서부터
			<div class="accepted_list" onclick="">
				<div class="small_jh flex-txtAlign">
					<div class="list_div">1</div>
					<div class="list_div">최멘티</div>
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
		<c:if test="${empty acceptedList}">
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
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${paging.startPage > paging.pageBlk }">
					<li class="page-item"><a class="page-link"
						href="mentoringAcceptedListPage?page=${paging.startPage - 1}&search=${search}&keyword=${keyword}" style="color: black;">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
					<li <c:if test="${paging.currentPage==i}">class="active"</c:if>><a class="page-link" 
						href="mentoringAcceptedListPage?page=${i}&search=${search}&keyword=${keyword}" style="color: black;">${i}</a></li>
				</c:forEach>
				<c:if test="${paging.endPage < paging.totalPage}">
					<li class="page-item"><a class="page-link" 
						href="mentoringAcceptedListPage?page=${paging.endPage + 1}&search=${search}&keyword=${keyword}" style="color: black;" >다음</a></li>
				</c:if>
			</c:if>
			<!-- 전체목록 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${paging.startPage > paging.pageBlk }">
				<li class="page-item"><a class="page-link" href="mentoringAcceptedListPage?page=${paging.startPage - 1}&search=${search}" style="color: black;">이전</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<li <c:if test="${paging.currentPage==i}">class="active"</c:if>>
				<a class="page-link" style="color: black;" href="mentoringAcceptedListPage?page=${i}&search=${search}">${i}</a>
				</li>
				</c:forEach>
				
				<c:if test="${paging.endPage < paging.totalPage}">
				<li class="page-item"><a class="page-link" 
					href="mentoringAcceptedListPage?page=${paging.endPage + 1}&search=${search}" style="color: black;">다음</a></li>
				</c:if>
			</c:if>
		</ul>
	
	<!-- CONTENT end -->
	</div>

<%@ include file="../public/sidebar_footer.jsp" %>
