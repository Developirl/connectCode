<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

   <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
    /* $("#svg").click(function(){
       alert("test");
       $("#myform").value = "";
       $("#myform").action = "mentoringApplyListPage";
       $("#myform").submit();       
       
    });  */  
    
    // 정렬 기능
    function search1(){
//       alert("test");
       location.href="mentoringApplyListPage?search="+$("#search").val()
    }   
    
    $(function(){
       
       $("#search option[value='${search}']").attr("selected", true);
       
    });
    
    
    </script>

   <div class="w3-container">
      <div class="fixedTop_div"></div>
      <font class="large_jh">받은 요청</font>
      <hr class="title_hr">
      <!-- CONTENT -->
      
      <!-- 검색 -->
      <div align="right" class="cont_mar" style="margin-bottom: 0px;">
         <!-- SELECT -->
         <div style="display: flex;">
	         <div style="width: 80%;">
		         <select class="search_sel small_jh" name="search" id="search" onChange="search1()">
		            <option value="">정렬</option>
		            <option value="new">최신순</option>
		            <option value="old">오래된순</option>
		         </select>
	         </div>
	         <div style="width: 20%; margin-left: 10px;">
			     <form id="myform" action="mentoringApplyListPage">
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
      </div>
      <!-- 검색 end -->
      
      <hr class="title_hr">
      
      <div class="cont_mar">
         <!-- 멘토링예약 list -->
          <!-- <div class="appointment" onclick=""> -->
         <c:forEach var="b" items="${list}">
         	<div style="display: flex;">
	            <div style="width: 30%">
	               <!-- img 주석 풀고 c:if 써서 멘토링방법이 대면인 경우, 전화인 경우 나눠서 이미지 출력 -->
	               <!-- <img class="mentoringType_img" src="/mentor/img/talk.jpg"> -->
	               <img class="mentoringType_img" src="/mentor/img/call.jpg">
	            </div>
	            <div class="mentee_info" style="width: 70%">
	               <div style="display: flex;">
	                  <div class="medium_jh" style="width: 50%;">${b.name}</div>
	                  <div class="small_jh" style="width: 50%; text-align: right; color: #777777">${b.apply_time}</div>
	               </div>
	               <div class="small_jh">${b.desired_job}</div>
	               <div class="small_jh">상담가능지역</div>
	               <div class="small_jh">[멘토링예약]멘티신청내용</div>
	            </div>
         	</div>
         <!-- </div> -->
         </c:forEach>
         <!-- 멘토링예약 list end -->
      </div>
      
      <!-- 주석 풀어서 사용 /// c:if 써서 요청 상담 empty 일때 보여지도록 (페이지 버튼은 가려지게 하기~) -->
      <c:if test="${empty list}">
      <div class="cont_mar">
         <div align="center" class="large_jh" style="margin-top: 20px;">
            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-emoji-dizzy" viewBox="0 0 16 16">
              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
              <path d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
            </svg>
            <br><br>아직 요청 받은
            <br>상담이 없습니다.
         </div>
      </div>
      </c:if>
      
      <hr class="title_hr">
      
      <!-- 페이지 버튼 css는 페이징 처리 하는 사람들이랑 맞추기 -->
      <ul class="pagination justify-content-center">
         <c:if test="${pp.startPage > pp.pagePerBlk }">
         <li class="page-item"><a class="page-link" href="mentoringApplyListPage?page=${pp.startPage - 1}" style="color: black;">이전</a></li>
         </c:if>
         
         <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
         <li <c:if test="${paging.currentPage==i}">class="active"</c:if>>
         <a class="page-link" style="color: black;"href="mentoringApplyListPage?page=${i}">${i}</a>
         </li>
         </c:forEach>
         
         <c:if test="${pp.endPage < pp.totalPage}">
         <li class="page-item"><a class="page-link" href="mentoringApplyListPage?page=${pp.endPage + 1}" style="color: black;">다음</a></li>
         </c:if>
      </ul>
   
   <!-- CONTENT end -->
   </div>

<%@ include file="../public/sidebar_footer.jsp" %>