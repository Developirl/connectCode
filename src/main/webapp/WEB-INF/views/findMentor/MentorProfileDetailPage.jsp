<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>

<%-- 부트 스트랩 아이콘을 class로 가져다 사용하기 위한 CDN --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<style>


/* 내가 사용하는 개인 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Domine:wght@600&display=swap');

.js-applypageContentbox{
	border:1px solid white;
	width:100%;
	padding-top:50px;
	padding-left:80px;
	padding-right:80px;
	margin-top:80px;
	margin-bottom:80px;
}

.js-applypageContentbox *{
	font-family: 'Noto Sans KR', sans-serif!important;
	color:#5D5D5D;
}

.js-MentorNavBar{
	border:1px solid #E1E6E6;
	border-right:none;
	border-left:none;
	background: white;
	
}

.js-Techcategory a{
   font-size:14pt;
   text-align: center;
   text-decoration: none;
   color:#5D5D5D;
}

.js-Techcategory:hover a{
	font-weight:bold;
    color:#5D5D5D;
    text-decoration: underline;
}

.js-Techcategory{
	text-align: center;
	padding-top:20px;
	padding-bottom:20px;
}

.js-profile-image{
   width:180px;
   height:180px;
   border-radius: 50%;
}

.js-profile-box td{
   padding-top:20px;
   padding-bottom:20px;
   padding-left:40px;
}

 
.js-MentorIntroBig{
   font-size:12pt;
   text-align: center;
   padding-bottom:40px!important;
   padding-top:40px!important;
   background: white;
   padding-left:0!important;
}
.js-MentorProfile-M{
   font-size:12pt;
}
.js-MentorProfile-S{
   font-size:11pt;
}
.js-MentorProfile-L{
   font-size:14pt;
   font-weight: bold;
}
.js-mentorInfoBox{
   border:1px solid #E1E6E6;
   margin-top:40px;
   padding:50px 20px;
   border-left:none;
   border-right: none;
   border-bottom:none;
}
.js-MentorCareerTable{
	border:2px solid #747474;
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
	padding-left:10px;
	margin-top:25px;
	border-radius: 10px;
}


.js-MentorCareerTable td,.js-MentorCareerTable th{
	padding-top:20px;
	padding-left:20px;
}

.js-reviewbox{
    border-bottom:thin;
}

/* 공유하기를 위한 css 공간 */
.link-icon { 
	position: relative; 
	display: inline-block; 
	width: auto;    
	font-size: 14px; 
	font-weight: 500; 
	color: #333; 
	margin-right: 10px; 
	padding-top: 50px; 
}
.link-icon.twitter { 
	background-image: url(/findMentor/img/icon-twitter.png); 
	background-repeat: no-repeat; 
	background-size: 25px;
}
.link-icon.facebook { 
	background-image: url(/findMentor/img/icon-facebook.png); 
	background-repeat: no-repeat; } 
.link-icon.kakao { 
	background-image: url(/findMentor/img/icon-kakao.png); 
	background-repeat: no-repeat; 
}

.js-top-align {
 /* vertical-align: top; */

}

.js-backgroundcolor{
	background: #F2F5F5;
}

.js-leftLine{
    border:2px solid #747474;
    border-right:none;
    border-top:none;
    border-bottom:none;
    padding-left:20px;
}

.js-profileFont{
	font-family: 'Noto Sans KR', sans-serif!important;
}

.js-mentortitlefont{
    font-size:24pt;
    font-weight: 500;
}

.js-paymentbottommargin:nth-child(2) td{
    padding-top:20px;
}

.js-mentoring-kindbox{
    border:1px solid #004EA2;
    background:#004EA2;
    border-radius: 10px;
    padding:5px 18px;
    color:white;
    text-align: center;
    
}
.bi-arrow-right-circle:hover,#js-reservation:hover .bi-arrow-right-circle{
	font-size:19pt!important;
}
#js-reservation:hover{
	color:#5D5D5D;
	font-weight: bold;
}

.js-reviewbox-content{
    border:1px solid white;
    width:100%!important;
    background: white;
    font-size:11pt;
    border-radius: 7px;
    padding: 10px 20px;
    margin-top:10px;
}
.js-reviewbox-date{
    color:#C8CCCC;
    font-size:10pt;
}



.js-width-review{
    width:100%;
}

.js-review-td{
	padding-top:0px!important;
}

.js-review-container{
    border:1px solid #E1E6E6;
    padding-bottom:30px;
    padding-right: 30px!important;
    border-left:none;
    border-right:none;
    border-bottom:none;
    
}

.js-reservation-button{
	margin-top:100px;
    border:3px solid #004EA2;
    background:#004EA2;
    border-radius:5px;
    width:100%;
    padding:10px;
    text-align: center;
    color:white;
    font-weight: 500;
    font-size:16pt;
}

.js-reservation-button:hover{
    border:3px solid #004EA2;
    background:white;
    color:#004EA2;
}

.js-accordion-button,.js-accordion-close-button{
	margin:40px auto;
	width:100%;
	text-align: center;
	align-self: center;

}

.js-accordion-button:hover,.js-accordion-close-button:hover{
	font-weight: bold;
}


.js-accordion-button,.js-accordion-close-button{
	cursor: pointer;
}



.js-modal-icon{
	display: inline;
}

.js-sharebox{
	border:1px solid #E1E6E6;
	border-radius: 10px;
	background: white;
	padding:40px 30px;
	text-align: center;
}

.js-sharebox *{
	font-family: 'Noto Sans KR', sans-serif!important;
}

.js-sharebox img{
	margin-right: 15px;
}
.js-sharefont{
	display:block;
	margin-bottom:20px;
}

.js-icorn-box-side {
  display: flex; 
  justify-content: center;
}


.bi-bookmark-fill,.bi-bookmark{
	margin-right: 10px;
	font-size:28px;
}

i{
	cursor: pointer;
}
</style>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>


<script>


// 시큐리티용 변수 
var csrf = "${_csrf.headerName}";
var csrfToken = "${_csrf.token}";



/* ----------- 소셜에 url 공유하기 -----------------*/
var title = 'Connect_Code';
var content = '${mentorInfo.name}'+' 멘토 프로필';
var myUrl = "localhost/findMentor/MentorProfileDetailPage?mentor_no="+${mentorInfo.mentor_no};


function shareTwitter() {
    var sendText = content; // 전달할 텍스트
    var sendUrl = myUrl; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
function shareFacebook() {
    var sendUrl = myUrl; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
function shareKakao() {

	  // 사용할 앱의 JavaScript 키 설정      
	  Kakao.init('${key}'); 

	  // 카카오링크 버튼 생성
	  Kakao.Link.createDefaultButton({
	    container: '#btnKakao', // 카카오공유버튼 id 속성 값
	    objectType: 'feed',
	    content: {
	      title: title, // 보여질 제목
	      description: content, // 보여질 설명
	      imageUrl: myUrl, // 콘텐츠 URL
	      link: {
	         mobileWebUrl: myUrl,
	         webUrl: myUrl
	      }
	    }
	  });
	}
	
/* --------------------- 소셜로 url 공유 모달 ----------------------*/

function abspos(e){
    this.x = e.clientX + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
    this.y = e.clientY + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
    return this;
} 

function itemClick(e){
    var ex_obj = document.getElementById('lay');
    if(!e) e = window.Event;
    pos = abspos(e);
    ex_obj.style.left = pos.x+"px";
    ex_obj.style.top = (pos.y+10)+"px";
    ex_obj.style.display = ex_obj.style.display=='none'?'block':'none';
}
 	

	
	
	
	
$(document).ready(function(){

	
	/* --------- 북마크 관련 설정 ----------------------*/
	 
	 
	 
	$(".bookmark-fill").hide();
	$(".bookmark").hide();


		if($(".js-bookmarkyn").val() == 1){
			$(".bookmark-fill").show();
		}else{
			$(".bookmark").show();
		}
		
		
		$(".js-bookmarkclick").click(function(){
			
			var mentor_no = ${mentorInfo.mentor_no };
			var clickchecked = 90;
			
			if($(this).data('value')==1){
				clickchecked=0;
			}else if($(this).data('value')==0){
				clickchecked=1;
			}
			
			$.ajax({
				 url: '/findMentor/bookmarkChange',
				  method: 'POST', 
				  data: {
					  clickchecked : clickchecked,
					  mentor_no : mentor_no  
				  },
		 		  beforeSend: function(xhr){
		       		xhr.setRequestHeader(csrf,csrfToken);
		          }, 
				  success: function(bookmark) {
					  
				
					  
					    // 즐겨찾기 취소한 경우
					  if(parseInt(bookmark) === 0){
						  $(".bookmark").show();
						  $(".bookmark-fill").hide();
						  
						// 즐겨찾기 한 경우	  
					  }else if(parseInt(bookmark) === 1){
						  $(".bookmark").hide();
						  $(".bookmark-fill").show();
						  
						  
					  }
					
					  
				  },
				  error: function(xhr, status, error) {
				    console.log(error); 
				  }
				});
				
			
		});
		
	
	
	
	
	
	
	
	
	
/* ---------------- 후기 아코디언 클릭 효과 ----------------- */
	var accordionclick = true;
	
	if(accordionclick){
		$(".js-review-container").hide();
		$(".js-accordion-close-button").hide();
	}
	
	$(".js-accordion-button").click(function(){
		
		if(accordionclick){
			$(".js-review-container").show();
			$(".js-accordion-close-button").show();
			$(".js-accordion-button").hide();
			accordionclick = false;
		}
	});
	
	$(".js-accordion-close-button").click(function(){
		if(!accordionclick){
			$(".js-review-container").hide();
			$(".js-accordion-close-button").hide();
			$(".js-accordion-button").show();
			accordionclick = true;
		}
		
	});
	
	
	
});	


// -----------  url 모달을 벗어난 경우 hide() ------------
$(document).ready(function(){
	
	$(".js-sharebox").mouseleave(function() {
	    var ex_obj = document.getElementById('lay');
	    ex_obj.style.display = 'none';
	  });
});
 
 
 
// -------------  멘토링 예약 페이지로 이동 ------------ 
function goApplyMentoringPage(kind){
	
	if(${ empty notEmptySession}){
		if(confirm("로그인하셔야 이용가능한 서비스입니다. \n로그인 페이지로 이동하시겠습니까?")){
			location.href="/member/loginform";
			return false;
		}else{
			return false;
		}
	}
	
	if(kind != null && kind != ''){
		location.href="/findMentor/applyMentoringPage?mentoring_kind="+kind+"&mentor_no="+${mentorInfo.mentor_no };
	}else{
		location.href="/findMentor/applyMentoringPage?mentor_no="+${mentorInfo.mentor_no };
	}
	
}
  
</script>





</head>



				<div id="lay" style="position: absolute; display: none;">
				<div class="js-sharebox" >
					<span class="js-sharefont">공유하기</span>
					<img src="/findMentor/img/icon-facebook.png" onclick="javascript:shareFacebook();" id="btnFacebook">
					<img src="/findMentor/img/icon-kakao.png" onclick="javascript:shareKakao();" id="btnKakao">
					<img src="/findMentor/img/icon-twitter.png" onclick="javascript:shareTwitter();" id="btnTwitter">
            	</div>
            	</div>    


<%@ include file="../public/header.jsp" %>

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
        	<div class="row">
        
        
            <div class="col-2"></div>
            
            
            <div class="col-8" >
            <%-- 여기 하위가 작업공간 --%>
            
            <div class="js-applypageContentbox js-backgroundcolor">
            
            	<div class="js-MentorCard">
            	    <table width=100% class="js-profile-box"><!--  멘토 네비바 상단 카드 -->
            	    
            	    <tr>
            	    <td colspan="2" class="js-mentortitlefont"><span class="js-profileFont">${mentorInfo.name } 멘토 프로필</span></td>
            	    <td colspan="1" align="right">
            	    
            	    
            	    <input type="hidden" class="js-bookmarkyn" value="${mentorInfo.checkedBookmark }">
            	    
            	    <div class="js-icorn-box-side">
            	       <sec:authorize access="isAuthenticated()"> 
	            	        <div class="bookmark-fill" style="width:auto;">
	            	        	<i class="bi bi-bookmark-fill js-bookmarkclick" style="color:#F2B661;" data-value="1"></i>
	            	   		</div>
	            	   </sec:authorize>     
            	       <sec:authorize access="isAuthenticated()"> 
	            	        <div class="bookmark">
		            	        <i class="bi bi-bookmark js-bookmarkclick" style="color:#F2B661;" data-value="0"></i>
	            	   		</div>
	            	   </sec:authorize>
            	        <div class="js-modal-icon" style="display:inline;" >
            	        <i class="bi bi-box-arrow-up fs-3 " onclick="itemClick(event);"></i>
						</div>
	            	</div>	        
            	        
            	    </td>
            	    </tr>
            	    
            	    
            	    <tr>
            	    	<td width=20%  >
            	    	 <c:if test="${ ! empty mentorInfo.file_url }">
	            	    	<img src="/download/${mentorInfo.physical_name}" class="js-profile-image">
            	    	 </c:if>
            	    	 <c:if test="${ empty mentorInfo.file_url }">
	            	    	<img src="/public/img/profile_img.png" class="js-profile-image">
            	    	 </c:if>
            	        </td>
            	        
            	        <td width=50% align=center > 
            	        <svg xmlns="http://www.w3.org/2000/svg" style="margin-bottom: 20px;" width="30" height="30" fill="currentColor" class="bi bi-quote" viewBox="0 0 16 16">
				        <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 9 7.558V11a1 1 0 0 0 1 1h2Zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 3 7.558V11a1 1 0 0 0 1 1h2Z"/>
				     	</svg>
				         	${mentorInfo.intro }
				      	<svg xmlns="http://www.w3.org/2000/svg" style="transform: scaleX(-1); margin-bottom: 20px;" width="30" height="30" fill="currentColor" class="bi bi-quote" viewBox="0 0 16 16">
				        <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 9 7.558V11a1 1 0 0 0 1 1h2Zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612c0-.351.021-.703.062-1.054.062-.372.166-.703.31-.992.145-.29.331-.517.559-.683.227-.186.516-.279.868-.279V3c-.579 0-1.085.124-1.52.372a3.322 3.322 0 0 0-1.085.992 4.92 4.92 0 0 0-.62 1.458A7.712 7.712 0 0 0 3 7.558V11a1 1 0 0 0 1 1h2Z"/>
				      	</svg>
            	        </td>
            	        
            	       <td width=30%>
            	       
            	       <div class="js-leftLine">
            	       <div class="js-MentorProfile-L">${mentorInfo.name }</div>
            	        <div class="js-MentorProfile-M">${mentorInfo.task }</div>
            	        <div class="js-MentorProfile-M">${mentorInfo.company }</div>
            	       </div>
            	       <%-- <sec:authorize access="isAuthenticated()"> 
	            	       <c:if test="${mentorInfo.checkedBookmark == 1 }">
	            	        <i class="bi bi-bookmark-fill fs-3" style="color:#F2B661;"></i>
	            	       </c:if> 
	            	   </sec:authorize>     
            	       <sec:authorize access="isAuthenticated()"> 
	            	       <c:if test="${mentorInfo.checkedBookmark == 0 }">
	            	        <i class="bi bi-bookmark fs-3" style="color:#F2B661;"></i>
	            	       </c:if> 
	            	   </sec:authorize>&nbsp;     
            	        <i class="bi bi-box-arrow-up fs-3"></i> --%>
            	        </td> 
            	        
            	    </tr>

            	   
            	    </table>
            	    
            	    <br><br>
            	    
        			<div class='js-MentorNavBar'>
	        			<table width=100%>
	        			<tr>
	        				<th width=25% class="js-Techcategory"><a href="#js-career">경력사항</a></th>
	        				<th width=25% class="js-Techcategory"><a href="#js-edu">학력사항</a></th>
	        				<th width=25% class="js-Techcategory"><a href="#js-pay">비용</a></th>
	        				<th width=25% class="js-Techcategory"><a href="#js-review">후기</a></th>
	        			</tr>
	        			</table> 
	      			</div>
	      			
		      		<div class="js-mentorInfoBox">	
		      			<div class="js-MentorProfile-L" id="js-career">경력사항</div>
		      			<table class="js-MentorCareerTable">
		      			    
		      			    <c:forEach var="i" items="${careerlist}">
			      			    <tr>
			      			    	<td><fmt:formatDate value="${i.entering_date}" pattern="yyyy-MM-dd"/> </td>
			      			    	<td>~</td>
			      			    	<td> <fmt:formatDate value="${i.departure_date}" pattern="yyyy-MM-dd"/></td>
			      			    	<td>&nbsp;&nbsp;${i.company }</td>
			      			    </tr>
		      			    </c:forEach>
		      			</table>
        			</div>    	    
            	    
		      		<div class="js-mentorInfoBox">	
		      			<div class="js-MentorProfile-L" id="js-edu">학력사항</div>
		      			<table class="js-MentorCareerTable">
		      			    <c:forEach var="i" items="${edulist}">
			      			    <tr>
			      			    	<td><fmt:formatDate value="${i.entering_date}" pattern="yyyy-MM-dd"/> </td>
			      			    	<td>~</td>
			      			    	<td> <fmt:formatDate value="${i.graduation_date}" pattern="yyyy-MM-dd"/></td>
			      			    	<td>&nbsp;&nbsp;${i.school }</td>
			      			    	<td>${i.major} 전공</td>
			      			    	<c:if test="${! empty i.minor }">
			      			    		<td>${i.minor} 부전공</td>
			      			    	</c:if>
			      			    	<td>${i.degree }</td>
			      			    </tr>
		      				</c:forEach>
		      			</table>
        			</div>    	    

		      		<div class="js-mentorInfoBox">	
		      			<div class="js-MentorProfile-L">수상내역 / 자격증</div>
		      			<table class="js-MentorCareerTable">
		      			    <c:forEach var="i" items="${licenselist}">
			      			    <tr>
			      			    	<td>${i.kind}</td>
			      			    	<td><fmt:formatDate value="${i.issuing_date}" pattern="yyyy-MM"/> </td>
			      			    	<td>&nbsp;&nbsp;${i.license_name}</td>
			      			    </tr>
                        	</c:forEach>
		      			</table>
        			</div>    	    

		      		<div class="js-mentorInfoBox">	
		      			<div class="js-MentorProfile-L">활동 가능 지역</div>
		      			<table class="js-MentorCareerTable" style="border-left:none;" width=100%>
		      			    <tr>
		      			    	<td width=100% style="padding-left:0;">
		      			    	
		      			    	<p style="margin-top: -12px">
									<em class="link"> <a href="javascript:void(0);"
											onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')"></a>
									</em>
							    </p>
								<div id="map" style="width:100%;height:350px;z-index:2147483647;"></div><!-- kakao map -->
		      			    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services" ></script>
		      			    	
		      			    	<script>
		      			    	
		      			    	
		      			    	/* ----------------- kakao map -----------------------*/



		      			    	var mentoring_loc = '${mentorInfo.mentoring_location}';
		      			    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		      			    	mapOption = {
		      			    	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		      			    	    level: 5 // 지도의 확대 레벨
		      			    	};  

		      			    	//지도를 생성합니다    
		      			    	var map = new kakao.maps.Map(mapContainer, mapOption); 

		      			    	//주소-좌표 변환 객체를 생성합니다
		      			    	var geocoder = new kakao.maps.services.Geocoder();

		      			    	//주소로 좌표를 검색합니다
		      			    	geocoder.addressSearch(mentoring_loc, function(result, status) {

		      			    	// 정상적으로 검색이 완료됐으면 
		      			    	 if (status === kakao.maps.services.Status.OK) {

		      			    	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		      			    	    // 결과값으로 받은 위치를 마커로 표시합니다
		      			    	    var marker = new kakao.maps.Marker({
		      			    	        map: map,
		      			    	        position: coords
		      			    	    });

		      			    	    // 인포윈도우로 장소에 대한 설명을 표시합니다
		      			    	    var infowindow = new kakao.maps.InfoWindow({
		      			    	    });
		      			    	    infowindow.open(map);

		      			    	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		      			    	    map.setCenter(coords);
		      			    	} 
		      			    	});  


		      			    	
		      			    	
		      			    	</script>
		      			    	
		      			    	
		      			    	
		      			    	</td>
		      			    </tr>
		      			</table>
        			</div>    	    


		      		<div class="js-mentorInfoBox">	
		      			<div class="js-MentorProfile-L" id="js-pay">멘토링 비용</div>
		      			<table class="js-MentorCareerTable"  style="border-left:none;width:100%;">
		      			    <c:forEach var="i" items="${payment }">
								<tr class="js-paymentbottommargin">
									<td width="30%">
									<div class="js-mentoring-kindbox">${i.mentoring_kind }</div>
									</td>		      			    
									<td width="15%"><fmt:formatNumber value="${i.mentoring_fee }" type="number" var="pay" />${pay} 원</td>	
									<td width="55%" align="right">
									<a style="text-decoration: underline;" id="js-reservation" onclick="goApplyMentoringPage('${i.mentoring_kind }');">&nbsp;&nbsp; 예약하기 &nbsp;&nbsp;
									<i class="bi bi-arrow-right-circle" style="font-size:16pt;margin-right: 50px;"></i>
									</a>
									</td>		      			    
								<!-- 	<td width="55%" align="right"><input type=button value="예약하기" class="js-reservationbutt"></td> -->		      			    
		      			    	</tr>
		      			    </c:forEach>
		      			</table>
        			</div>    	    

		      		<div class="js-mentorInfoBox">	
		      			<div class="js-MentorProfile-L" id="js-review">멘토링 후기</div>
		      			<br>
		      			
						<c:set var="avg" value="${avg}" />
						평균 별점 
						<c:forEach begin="1" end="5" var="i">
						    <c:set var="roundedAvg" value="${(avg - (i-1)) > 0.5 ? 1 : (((avg - (i-1)) == 0.5 ) ? 0.5 : 0)}" />
						    
						    <c:choose>
						        <c:when test="${roundedAvg == 1}">
						            <i class="bi bi-star-fill" style="color:#F2B661;font-size:14pt;"></i>
						            <!-- 별 아이콘에 filled 클래스 적용 -->
						        </c:when>
						        <c:when test="${roundedAvg == 0.5}">
						            <i class="bi bi-star-half" style="color:#F2B661;font-size:14pt;"></i>
						            <!-- 별 아이콘에 half 클래스 적용 -->
						        </c:when>
						        <c:otherwise>
						            <i class="bi bi-star" style="color:#F2B661;font-size:14pt;"></i>
						            <!-- 별 아이콘에 empty 클래스 적용 -->
						        </c:otherwise>
						    </c:choose>
						</c:forEach>
						
						
						
						&nbsp;&nbsp;
						<span style="font-size:10pt;">
		      			후기<c:if test="${reviewcount !=0 }">+</c:if>
		      			${reviewcount } 개
		      			</span>
						
						<br><br>
						
						
						
						<c:if test="${reviewcount != 0 }">
						
						
						<div class="js-accordion-button">후기 펼쳐보기
						<i class="bi bi-chevron-bar-down"></i>
						</div>
						
						
						<c:forEach var="i" items="${reviewlist }" varStatus="st">

						 <div class="js-review-container">
			      			<table class="js-MentorCareerTable js-reviewbox js-width-review" >
			      			<c:set var="name" value="${i.name }"/>
			      			    <tr>
			      			    <td class="js-review-td">
			      			    <b>${fn:substring(i.name, 1,2)} * *</b></td>
			      			    </tr>
			      			    <tr>
			      			    <td class="js-review-td">
			      			    <span class="js-reviewbox-date">
			      			    <fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd"/>
			      			    &nbsp;&nbsp;${i.mentoring_kind }
			      			    </span>
			      			    </td>
			      			    </tr>
			      			    
			      			    <tr>
			      			    <td class="js-review-td">
			      			    <c:set var="rating" value="${i.rating}" />
			      			    <c:forEach begin="1" end="5" var="j">
											<c:choose>
												<c:when test="${j <= rating}">
													<i class="bi bi-star-fill" style="color: #F2B661;font-size:11pt;"></i>
													<!-- 별 아이콘에 filled 클래스 적용 -->
												</c:when>
												<c:otherwise>
													<i class="bi bi-star" style="color: #F2B661;font-size:11pt;"></i>
													<!-- 별 아이콘에 empty 클래스 적용 -->
												</c:otherwise>
											</c:choose>
								</c:forEach>
								</td>
			      			    </tr>
			      			    
			      			    
			      			    <tr>
			      			    <td colspan="3" width=100% >
			      			    	<div class="js-reviewbox-content js-mini">${i.content }</div>
			      			    </td>
			      			    </tr>
			      			</table>
			      		  </div>	

		      			</c:forEach>

	        			<div class="js-accordion-close-button">후기 접기
						<i class="bi bi-chevron-bar-up"></i>
						</div>   
    
            	    </c:if><!--  후기가 없다면 뜨지 않게 한다.  -->
            	    
            	    <c:if test="${reviewcount == 0 }">
            	    	<div style="font-size:12pt;text-align: center;margin-top:60px;">아직 작성된 후기가 없습니다. </div>
            	    </c:if>
        			</div>    	 
        			
            	    
            	
            	</div>
        
        		<div class="js-reservation-button" onclick="goApplyMentoringPage();">멘토링 예약하기</div>    
            
                <br><br><br><br><br><br><br>



				



            
            </div>
            
            <%-- 작업공간 끝 --%>
            </div>
            
            
            
            
            <div class="col-2"></div>
            
            </div>
        </div>

<%@ include file="../public/footer.jsp" %>        








        