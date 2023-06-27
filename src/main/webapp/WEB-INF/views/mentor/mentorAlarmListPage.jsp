<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<%-- 부트 스트랩  'x' 아이콘을 class로 가져다 사용하기 위한 CDN --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<style>

	/*   ------- 모달 css 입니다. --------- */
	.jh-reserve-detail-modal {
		position: fixed;
		top: 0;
		left: 0;
		right:0;
		bottom:0;
		width: 100%!important;
		height: 100%!important;
		display: none;
		background-color: rgba(0, 0, 0, 0.4);
		z-index:999;
	}
	
	.jh-reserve-detail-modal.show {
		display: block;
	}
	
	.jh-reserve-detail-modal_body {
		position: absolute;
		top: 50%;
		left: 50%;
		width: 600px;
		/*height: 600px;*/
		padding: 50px 30px;
		text-align: center;
		background-color: rgb(255, 255, 255);
		border-radius: 10px;
		box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		transform: translateX(-50%) translateY(-50%);
		z-index:1;
		max-height: 80%;
	    overflow: auto;
		
	}
	/*  이건 모달 닫는 x 버튼 css 입니당. 수정해서 사용하세요 */
	.bi-x-circle{
		font-color:#ccc;
		font-size:14pt;
	}
	
	/* 위에 모달 닫는 x 버튼 고정시키는 css 입니당. */
	.jh-modal-cancelbutt{
		position: absolute;
		top:20px;
		left:95%;
	}
	
	</style>
	
	<script>
	// 모달 오픈하는 함수로, 오픈시킬 버튼에 onclick에서 함수 호출해주심 됩니다.
	function openReserveDetailModal(alarm_no) {
	    const modal = document.querySelector('.jh-reserve-detail-modal');
	    
		$.ajax ({
	    	url : 'mentorAlarmDetailPage',
	    	type : 'get',
	    	data : {alarm_no : alarm_no},
			success: function(response) {
				// alert("response:"+response);
				$("#jh-content").html(response);
			     // Request was successful
			     console.log(response);
			} // success end
	    }); // ajax end
	    
	    modal.style.display = 'block';
	}
	// 모달 닫는 함수, onclick 에서 함수 호출
	function closeReserveDetailModal(){
	    const modal = document.querySelector('.jh-reserve-detail-modal');
	    modal.style.display = 'none';
	    location.reload();
	}
	
	</script>


	<div class="w3-container">
		<div class="fixedTop_div"></div>
		<font class="large_jh">알람</font>
		<hr class="title_hr">
		<!-- CONTENT -->
		
		<!-- 검색 -->
		<div align="right" class="cont_mar">
			<!-- INPUT -->
			<div style="width: 20%; margin-left: 10px;">
              <form id="myform" action="mentorAlarmListPage">
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
				<div class="alarm_div">번호</div>
				<div class="alarm_div">제목</div>
				<div class="alarm_div">전송일자</div>
				<div class="alarm_div">작성자</div>
			</div>
		</div>
		<hr class="title_hr">
		
		<div class="list_mar">
			
			<!-- 알람 list -->
			<c:forEach var="sel_al" items="${sel_alarm}">
				<c:if test="${sel_al.read_yn == 'N'}">
					<div class="accepted_list" onclick="openReserveDetailModal(${sel_al.alarm_no})" style="font-weight: bold;">
						<div class="small_jh flex-txtAlign">
							<div class="alarm_div">${sel_al.row_num}</div>
							<div class="alarm_div">${sel_al.title}</div>
							<div class="alarm_div"><fmt:formatDate value="${sel_al.happen_time}" pattern="yyyy-MM-dd"/></div>
							<div class="alarm_div">운영팀</div>
						</div>
					</div>
				</c:if>			
				<c:if test="${sel_al.read_yn == 'Y'}">
					<div class="accepted_list" onclick="openReserveDetailModal(${sel_al.alarm_no})" style="color: gray;">
						<div class="small_jh flex-txtAlign">
							<div class="alarm_div">${sel_al.row_num}</div>
							<div class="alarm_div">${sel_al.title}</div>
							<div class="alarm_div"><fmt:formatDate value="${sel_al.happen_time}" pattern="yyyy-MM-dd"/></div>
							<div class="alarm_div">운영팀</div>
						</div>
					</div>
				</c:if>			
			</c:forEach>
			<!-- 알람 list end -->
			
		</div>
		
		<c:if test="${empty sel_alarm}">
		<div class="cont_mar">
			<div align="center" class="large_jh" style="margin-top: 20px;">
				<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16">
				  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				  <path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
				</svg>
				<br><br>알림이 없습니다.
			</div>
		</div>
		</c:if>
		
		<hr class="title_hr">
		
		<ul class="pagination justify-content-center">
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${paging.startPage > paging.pageBlk }">
					<li class="page-item"><a class="page-link"
						href="mentorAlarmListPage?page=${paging.startPage - 1}&search=${search}&keyword=${keyword}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
					<li <c:if test="${paging.currentPage==i}">class="active"</c:if>><a class="page-link" 
						href="mentorAlarmListPage?page=${i}&search=${search}&keyword=${keyword}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;">${i}</a></li>
				</c:forEach>
				<c:if test="${paging.endPage < paging.totalPage}">
					<li class="page-item"><a class="page-link" 
						href="mentorAlarmListPage?page=${paging.endPage + 1}&search=${search}&keyword=${keyword}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;" >다음</a></li>
				</c:if>
			</c:if>
			<!-- 전체목록 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${paging.startPage > paging.pageBlk }">
				<li class="page-item"><a class="page-link" href="mentorAlarmListPage?page=${paging.startPage - 1}&search=${search}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;">이전</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<li <c:if test="${paging.currentPage==i}">class="active"</c:if>>
				<a class="page-link" style="color: black;" href="mentorAlarmListPage?page=${i}&search=${search}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}">${i}</a>
				</li>
				</c:forEach>
				
				<c:if test="${paging.endPage < paging.totalPage}">
				<li class="page-item"><a class="page-link" 
					href="mentorAlarmListPage?page=${paging.endPage + 1}&search=${search}&mentor_no=${msel.mentor_no}&member_no=${msel.member_no}" style="color: black;">다음</a></li>
				</c:if>
			</c:if>
		</ul>
	
	<!-- CONTENT end -->
	</div>
	
	<!-- 모달 띄우기 -->
	<div class="jh-reserve-detail-modal">
      <div class="jh-reserve-detail-modal_body" align=center>
    
    	<div class="jh-modal-cancelbutt" onclick="closeReserveDetailModal();">
    	<i class="bi bi-x-circle"></i>
    	</div>
	    	<div>
	           <div id='jh-content'></div>
	        </div>
      </div>
    </div>

<%@ include file="../public/sidebar_footer.jsp" %>
