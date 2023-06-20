<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<head>
<%-- 부트 스트랩 아이콘을 class로 가져다 사용하기 위한 CDN --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<style>

/* 내가 사용하는 개인 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');

.js-allcontentbox {
	margin-top: 40px;
}


.js-profileCard {
	float:left;
	border: 1px solid white;
	border-radius:10px;
	padding: 10px 15px;
	padding-top:50px;
	padding-right:30px;
	width: 45%;
	margin-bottom: 30px;
	text-align:left;
	box-shadow: 6px 6px 15px 1px #EDF2F2;
	position:relative;
}

@media(max-width:1600px){
   .js-profileCard{
      width:100%;
      margin-left: 0!important;
      margin-right: 0!important;
   }   
   .js-allcontentbox {
}
  
}

.js-profileCard:hover{
	box-shadow: 8px 8px 28px 4px #E1E6E6;
}

.js-circular-image {
	width: 130px;
	height: 130px;
	border-radius: 50%;
}

.js-allcontentbox:nth-child(odd) .js-profileCard {
	margin-right: 50px;
	margin-left:3%;
}

.js-profileCardtable td:nth-child(even){
    padding-left:30px;
}


.js-profileCardtable .js-profileimgtd{
    text-align: center;
}

.js-profileimgtd{
    width:180px!important;
}

.js-profileCardtable td{
    padding-bottom:30px;
    padding-left:20px;
}

.js-mentorlistwrapper{
	border: 1px solid white;	
    overflow: auto;
    padding-rigth:0;
}

.js-technotag{
    display:inline-block;
    margin-right:10px;
    border:1px solid #004EA2;
    color:#004EA2;
    /*background:#FAF7F5;*/
    border-radius: 10px;
    padding:3px 15px;
    margin-bottom:10px;
    font-size:11pt!important;
    
}

.js-profileCardtable *{
    font-family: 'Noto Sans KR', sans-serif!important;
}


.js-profileCardName{
    font-weight: bold;
    font-size:14pt;
    margin-bottom:10px;
    display:block;
}
.js-profileCardIntro{
    font-weight:400;
    font-size:12pt;
    display: block;
    margin-bottom:10px;
}

.js-priceColor{
    color:#A6A6A6;
}
.js-reservationbutton{
   border:1px solid #004EA2;
   background:#004EA2;
   color:white;
   padding:15px 30px;
   text-align: center;
   border-radius: 10px;
   cursor: pointer;
   margin-left:20px;
   font-size:11pt;
}

.js-reservationbutton-close{
   font-size:11pt;
   border:1px solid #ccc;
   background: #ccc;
   color:white;
   padding:15px 30px;
   text-align: center;
   border-radius: 10px;
}

.js-reservationbutton:hover{
   border:1px solid #004EA2;
   background:white;
   color:#004EA2;
}

.js-reviewcountstyle{
  font-size:11pt;
  color:#A6A6A6;
}


.js-mentoringPrice td{
   padding-right:10px;
   padding-left:0;
}

.js-career,.js-company{
   color:#A6A6A6;
}
.js-career-mini,.js-company-mini{
   color:#A6A6A6;
   font-size:11pt;   
}

.bi-bookmark,.bi-bookmark-fill{
    cursor: pointer;
}

.js-tech-tabletd{
    height: 180px;
}

.js-fontsize-11{
    font-size:11pt;
}


/*여기부터는 필터 영역 */
.js-mentorListfilterbox{
	margin:50px 50px 40px 30px;
	text-align:left;
}

.js-mentorListfilterbox * {
	font-family: 'Noto Sans KR', sans-serif!important;
	font-size:11pt!important;
}


/*드롭다운*/
.dropdown{
  position : relative;
  display : inline-block;
  margin-right: 12px;
}

.dropbtn{
  border : 3px solid #B2CCFF;
  border-radius : 30px;
  background:white;
  font-weight: 400;
  color : #2570BA;
  padding : 5px 5px;
  width :120px;
  text-align: center;
  cursor : pointer;
  font-size : 12pt!important;
  margin-top:10px;
  
}

.filterreset{
	background: #E6EBEB;
}

.dropdown-content{
  display : none;
  position : absolute;
  z-index : 1; /*다른 요소들보다 앞에 배치*/
  font-weight: 400;
  background-color: white;
  border:2px solid #004EA2;
  min-width : 200px;
  overflow: scroll;
  font-size:12pt!important;
  border-radius: 9px;
}

.dropdown-content a{
	  display : block;
	  text-decoration : none;
	  color : #004EA2;
	  font-size: 12pt;
	  padding : 12px 20px;
}

.dropdown-content a:hover{
	  background-color : #ececec
}

.dropdown:hover .dropdown-content {
  	display: block;	
}

#js-choicefilter, #js-choicefilter-etc1,#js-choicefilter-etc2,#js-choicefilter-etc3{
	  margin-top:50px;
	  margin-left:10px;
	  color:#A6A6A6;
	  font-size:12pt!important;
}
#js-choicefilter-etc1,#js-choicefilter-etc2,#js-choicefilter-etc3{
	  margin-top:10px;
	  margin-right: 10px;
}
/*
#js-choicefilter-etc1,#js-choicefilter-etc2{
     display: inline-block;
     margin-right:15px;
}
*/
/* .js-mentorListfilterbox .bi-arrow-clockwise{
	color:#9E9E9E;
	margin-top:20px;
	cursor: pointer;
}                           ------------------------------------------------
 */

.js-arrowbox *{
    display: flex;
}

.dropdown .dropbtn_icon,.js-techStack{
	font-size:12pt!important;
}

#js-arrow-clockwise-font{
    font-size:10pt!important;
    display:inline;
    color:#8C8C8C;
}

.js-techStack,.js-gender,.js-region,.js-career{
    font-size:12pt!important;
}


.js-searchbutton{
	display:block;
	margin-top:10px;
	margin-left:10px;
	border:1px solid #8C8C8C;
	color:#8C8C8C;
	background:white;
	border-radius: 8px;
	padding:3px 10px; 
	font-size:11pt!important;
}

.js-keywordsearch td:nth-child(2){
    text-align:right!important;
}

.bi-arrow-clockwise{
    width:120px;
}

#afterfilter{
    display: block;
    text-align:center;
    color:#006B99;
    margin-top:20px;
}


/* ------ 페이징 처리 안하는 경우 상단으로 가기 화살표 --- */

.js-toparrow{
  position: fixed;
  top: 80%;
  width: 99%; /* 좌우 배치 비율 조정 */
   
}



</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>


function filterappend(str){
	$("#js-choicefilter").append(str);
}


$(document).ready(function(){
	
	
	$(".js-searchbutton").hide();

	if($("#js-choicefilter").text().length==0){
		$(".js-searchbutton").hide();
	};
	

	
	$("#afterfilter").text('');
	
	// 필터 변수 선언
	var stacksfilter = '';
	var loc = '';
	var gender = '';
	var years = 0;
	
	
	// 처음 해당 페이지 들어온 경우 이전에 검색한 필터가 있다면 목록을 출력한다. 
	if($("#stacks").val()!=''){
		alert($("#stacks").val());
		
		const stacksarr = $("#stacks").val().replace(',;',',').split(','); 
		
		if(stacksarr.length>0){
        	if($("#js-choicefilter").text().length==0){
    			$("#js-choicefilter").append("선택한 기술 스택 : ");
    		}
        }
		for(let i=0;i<stacksarr.length-1;i++){
			stacksarr[i] = stacksarr[i].replace(';','');
			alert(stacksarr[i]);
			stacksfilter +=  stacksarr[i]+',;'; // 컨트롤러로 넘겨주기 위한 값도 셋팅
			$("#js-choicefilter").append(stacksarr[i]+"  ");
			$("#afterfilter").text('필터가 적용된 검색 내역입니다. ');
		}
	}
	
	if($("#location").val()!=''){
		$("#js-choicefilter-etc1").text("#"+$("#location").val());
		loc = $("#location").val();
		$("#afterfilter").text('필터가 적용된 검색 내역입니다. ');
	}
	
	if($("#gender").val()!=''){
		$("#js-choicefilter-etc2").text("#"+$("#gender").val());
		gender = $("#gender").val();
		$("#afterfilter").text('필터가 적용된 검색 내역입니다. ');
	}
	
	if($("#years").val()>0){
		$("#js-choicefilter-etc3").text("#"+$("#years").val()+'년 이상');
		years = parseInt($("#years").val());
		$("#afterfilter").text('필터가 적용된 검색 내역입니다. ');
	}
	
	
	
	
	$(".js-techStack").click(function(){
		
		var SelectedStacks = $("#js-choicefilter").text();
		
		if(SelectedStacks.length==0){
			$("#js-choicefilter").append("선택한 기술 스택 : ");
			$(".js-searchbutton").show();
		}
		
		// 기술 스택 중복 선택시 추가 안되도록 한다. 
		if(SelectedStacks.indexOf($(this).data('value'))==-1){
			stacksfilter +=  $(this).text()+',;';
			//$("#js-choicefilter").append($(this).text()+"  ");
			filterappend($(this).text()+"  ");
			$(".js-searchbutton").show();
		}
		

	});
	

	$(".js-region").click(function(){
		$("#js-choicefilter-etc1").text("#"+$(this).text());
		loc = $(this).data('value');
		$(".js-searchbutton").show();

	});
	
	$(".js-gender").click(function(){
		$("#js-choicefilter-etc2").text("#"+$(this).text());
		gender = $(this).data('value');
		$(".js-searchbutton").show();

	});
	
	$(".js-career").click(function(){
		$("#js-choicefilter-etc3").text("#"+$(this).text());
		years = parseInt($(this).data('value'));
		$(".js-searchbutton").show();
	});

	// 초기화 버튼 클릭시 
	$(".bi-arrow-clockwise").click(function() {
		location.href="/findMentor/mentorlistpage";
	});
	
	// 검색 필터 적용시
	$("#js-searchbutton").click(function(){
	    alert('선택한 기술 스택: '+stacksfilter);
	    const encodedValue = encodeURIComponent(stacksfilter);
	    location.href="/findMentor/mentorlistpage?technology="+encodedValue+"&mentoring_location="+loc+"&gender="+gender+"&years="+years;
		
	});
	
	
	$("*").click(function(){
		if($(".js-searchbutton").is(':visible')){
			$("#afterfilter").text('');
		}
	});
	
	if(${ empty list }){
			$("#afterfilter").text('');
	}
	

});

function scrollToTop() {
	  // 스크롤 위치를 0으로 설정하여 상단으로 이동
	  window.scrollTo({
	    top: 0,
	    behavior: 'smooth' // 부드러운 스크롤 동작을 위해 'smooth' 옵션 사용
	  });
	}

	// 클릭 이벤트 발생 시 scrollToTop() 함수 호출
	document.addEventListener('click', function(event) {
	  // 클릭한 요소가 페이지 상단으로 이동하는 버튼인 경우에만 동작하도록 조건을 추가할 수 있습니다.
	  var target = event.target;
	  if (target.matches('.scroll-to-top-button')) {
	    scrollToTop();
	  }
	});

	
function goMentorProfileDetailPage(mentor_no,bookmark){
	location.href="/findMentor/MentorProfileDetailPage?mentor_no="+mentor_no+"&bookmark="+bookmark;
}	
	
	
</script>



</head>

	<input type="hidden" id="stacks" value="${filterdto.technology }">
	<input type="hidden" id="location" value="${filterdto.mentoring_location}">
	<input type="hidden" id="gender" value="${filterdto.gender }">
	<input type="hidden" id="years" value="${filterdto.years }"><!-- 검색안했을 경우 0 -->

<%@ include file="../public/header.jsp"%>
<input type=hidden id="js-topposition">

<!-- 실제 콘텐츠 들어가는 부분 -->
<div class="container-fluid main-content">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8" align=center>
			<%-- 여기 아래서만 작업 합니다.  --%>
			
			<!-- 필터 설정 영역 -->
			
			<div class="js-mentorListfilterbox">
			
			<!-- 기술스택 선택  -->			
			<div class="dropdown">
			      <button class="dropbtn"> 
			        <span class="dropbtn_icon">기술스택</span>
			      </button>
			      <div class="dropdown-content" style="height: 500px;">
			      
			      	<c:forEach var="stack" items="${techStacks}">
			      	  <a class="js-techStack" data-value="${stack}">${stack }</a>
			      	</c:forEach>
			      
			      </div>
		    </div>


			<!--  지역 선택  -->
			<div class="dropdown">
			      <button class="dropbtn"> 
			        <span class="dropbtn_icon">지역선택</span>
			      </button>
			      <div class="dropdown-content" style="height: 500px;">
			      
			      	<c:forEach var="region" items="${regionList}">
			      	  <a class="js-region" data-value="${region}">${region}</a>
			      	</c:forEach>
			      
			      </div>
		    </div>
		
		
		
			<!--  성별 선택  -->
			<div class="dropdown">
			      <button class="dropbtn"> 
			        <span class="dropbtn_icon">멘토 성별</span>
			      </button>
			      <div class="dropdown-content">
			      
			      	  <a class="js-gender" data-value="female">여성 멘토</a>
			      	  <a class="js-gender" data-value="male">남성 멘토</a>
			      
			      </div>
		    </div>


			
	
			<!--  경력 선택  -->
			<div class="dropdown">
			      <button class="dropbtn"> 
			        <span class="dropbtn_icon">경력</span>
			      </button>
			      <div class="dropdown-content">
			      
			      	  <a class="js-career" data-value="1">1년 이상</a>
			      	  <a class="js-career" data-value="3">3년 이상</a>
			      	  <a class="js-career" data-value="5">5년 이상</a>
			      	  <a class="js-career" data-value="7">7년 이상</a>
			      	  <a class="js-career" data-value="10">10년 이상</a>
			      
			      </div>
		    </div>

			<!-- 필터 초기화  -->
			<div class="dropdown">
			      <button class="dropbtn filterreset"> 
			        <span class="dropbtn_icon"><i class="bi bi-arrow-clockwise" >초기화</i></span>
			      </button>
		    </div>
		    
		    <!-- 검색 필터 결과 출력 위치 -->
		    <div id="js-choicefilter"></div>
		    <span id="js-choicefilter-etc1"></span>
		    <span id="js-choicefilter-etc2"></span>
		    <span id="js-choicefilter-etc3"></span>

            <span id="afterfilter"></span>
			<input type=button value="필터 적용 검색" class="js-searchbutton" id="js-searchbutton"> 


			
			</div>
	

	
	        <%-- *************************************************************************************** --%>
	
	
			
			<!--  프로필 카드 영역 -->
			
			<c:if test="${ empty list }">
			<br><br>
			<div align=center style="font-family:'Noto Sans KR', sans-serif!important;font-weight: bold;">검색한 항목에 해당하는 멘토가 존재하지 않습니다 .</div>
			</c:if>
			
			
			<div class="js-mentorlistwrapper">
			
			
			   <c:forEach var="i" items="${list}">
					<div class="js-allcontentbox" >
						<div class="js-profileCard">
						
						
						
						<sec:authorize access="isAuthenticated()"> 
							<c:if test="${i.checkedBookmark == 0 }">
							    <div align=right><i class="bi bi-bookmark fs-3" style="color:#F2B661;"></i></div>
							</c:if>
						
							<c:if test="${i.checkedBookmark == 1 }">
							    <div align=right><i class="bi bi-bookmark-fill fs-3" style="color:#F2B661;"></i></div>
							</c:if>
						
						
						</sec:authorize>

						<%--
							<sec:authorize access="hasAnyRole('ROLE_12')">
								<div class="grid-sample" style="height: 600px;">
									<div id="grid_data" style="height: 600px;">이건 멘티 계정</div>
								</div>
							</sec:authorize>
						 --%>



							<table class="js-profileCardtable">
								<tr>
								<td class="js-profileimgtd">
									<c:if test="${ ! empty i.file_url}">
										<img alt="profile" src="${i.file_url}" class="js-circular-image">
									</c:if>
									<c:if test="${ empty i.file_url}">
										<img alt="profile" src="/public/img/profile_img.png" class="js-circular-image">
									</c:if>
								</td>
								<td>
								<span class="js-profileCardFont">
									<span class="js-profileCardName">${i.name }</span>
									<span class="js-profileCardIntro">${i.intro }</span>
									<span class="js-profileCardIntro js-company-mini">${i.company }</span>
									<span class="js-profileCardIntro js-career-mini">${i.years }년차  &nbsp;${i.task }</span>
								</span>	
								</td>
								</tr>
								
								
								<tr>
								<td colspan="2" class="js-tech-tabletd">
								<span class="js-reviewcountstyle"> 후기 &nbsp;
								<c:if test="${i.reviewcount != 0}">+</c:if>
								${i.reviewcount }
								</span><br><br>
								<%-- <c:set var="str" value="${i.technology}" /> --%>
								<c:set var="str" value="${i.technology}" />
								<c:set var="techno" value="${fn:split(str, ',')}" />
								
								<c:forEach var="techno" items="${techno}">
								  <div class="js-technotag"># ${techno}</div>
								</c:forEach>
								</td>
								</tr>
								
								<tr>
								<td colspan="2">
								
									<table class="js-mentoringPrice">
									<tr>
									
									<c:if test="${! empty i.mentoring_payment[0]}">
										<c:set var="payment" value="${fn:split(i.mentoring_payment[0], ';')}"/>
											<td class="js-fontsize-11"><b>${payment[0]}</b><br>
											<span class="js-priceColor">
											<fmt:formatNumber value="${payment[1]}" type="number" var="numberType" />${numberType }
											</span></td>
									</c:if>


									<c:if test="${! empty i.mentoring_payment[1]}">
										<c:set var="payment" value="${fn:split(i.mentoring_payment[1], ';')}"/>
											<td class="js-fontsize-11"><b>${payment[0]}</b><br>
											<span class="js-priceColor">
											<fmt:formatNumber value="${payment[1]}" type="number" var="numberType" />${numberType }
											</span></td>
									</c:if>
									
									<c:if test="${empty i.mentoring_payment[0] && empty i.mentoring_payment[1] }">
									 
										<td class="js-payment-td">
											<div class="js-reservationbutton-close" ><b>멘토 준비중</b></div>
										</td>

									</c:if>
									
									<c:if test="${! empty i.mentoring_payment[0] || ! empty i.mentoring_payment[1] }">
									
										<td class="js-payment-td">
											<div class="js-reservationbutton" onclick="goMentorProfileDetailPage('${i.mentor_no}',${i.checkedBookmark })"><b>예약하기</b></div>
										</td>

									</c:if>
									</tr>
									</table>                                                                                                      
								
								</td>
								</tr>
							</table>
						</div>			   
					</div>
			   </c:forEach>
			 
			 
			</div>   
			<%-- 여기까지가 작업하는 라인 --%>
		</div>
		<div class="col-2">
			<div class="js-toparrow" onclick="scrollToTop();"> <!--  아ㅣㄴ 여기 왜 안돼 .. -->
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#D5D5D5" class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
		  			<path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
				</svg>
			</div>
		</div>
	</div>
</div>

<div style="position:relative;"></div>
<%@ include file="../public/footer.jsp"%>
