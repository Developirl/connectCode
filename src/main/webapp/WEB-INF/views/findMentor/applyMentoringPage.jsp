<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    

<head>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- 부트 스트랩 아이콘을 class로 가져다 사용하기 위한 CDN --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>

/* 내가 사용하는 개인 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Domine:wght@600&display=swap');

.js-applypage-Contentbox *{
	font-family: 'Noto Sans KR', sans-serif!important;
	color:#5D5D5D;
}

.js-applypage-Contentbox{
	border:1px solid white;
	width:100%;
	padding-top:150px;
	padding-bottom:150px;
	padding-left:80px;
	padding-right:80px;
	margin-top:80px;
	margin-bottom:80px;
	background: #F2F5F5;
}

.js-selectbox-kind{
	border:1px solid #E1E6E6;
	width:100%;
	padding:60px 20px;
	border-bottom:none;
	border-left:none;
	border-right: none;
}



.js-selectbox-kind:nth-child(1){
	border-top:none;
	padding-top:40px;
}


.js-selectbox-font-L{
	font-size:14pt;
	font-weight: bold;
}

.js-selectbox-font-mini{
	font-size: 11pt;
	font-weight: 500;
	color:#737373;
}
.js-mentoring-kindbox2{
    border:2px solid #004EA2;
    background:#F2F5F5;
    border-radius: 10px;
    padding:5px 18px;
    color:#004EA2;
    text-align: center;
    margin-right: 30px;
    margin-left: 20px;
    font-weight: 500;
}
.js-paymentbottommargin2:nth-child(2) td{
    padding-top:20px;
}

.js-paymentbottommargin2-parent{
	margin-top:30px;
}


.bi-check-circle,.bi-check-circle-fill{
	font-size:18pt;
	cursor: pointer;
	color:#E6B35C;
}

.bi-check-circle:hover,.bi-check-circle-fill:hover{
	font-size:20pt;
	font-weight:bold;
	cursor: pointer;
}

.bi-check-circle-fill{
	font-size:20pt;
}

.bi-check-circle-fill:hover{
	font-size:18pt;
}

.js-writebox{
	width: 100%;
}


/* 라디오 버튼 css */
.js-sel-radio {
  vertical-align: middle;
  appearance: none;
  border: max(2px, 0.1em) solid gray;
  border-radius: 50%;
  width: 1.25em;
  height: 1.25em;
  transition: border 0.5s ease-in-out;
}

.js-sel-radio:checked {
  border: 0.4em solid #F0BB60;
}

.js-sel-radio:focus-visible {
  outline-offset: max(2px, 0.1em);
  outline: max(2px, 0.1em) dotted #F0BB60;
}

.js-sel-radio:hover {
  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
  cursor: pointer;
}

.js-sel-radio:disabled {
  background-color: lightgray;
  box-shadow: none;
  opacity: 0.7;
  cursor: not-allowed;
}

.js-sel-radio:disabled + span {
  opacity: 0.7;
  cursor: not-allowed;
}

.js-calendar-week,.js-time-css{
	border:3px solid #ABABAB;
	background:#F2F5F5;
	padding:10px 20px;
	display:inline-block;
	margin-right: 12px;
	border-radius: 5px;
	font-size:12pt!important;
	font-weight: 550;
	line-height: 25px;
	margin-bottom:15px;
}

.js-time-css{
	margin-top:20px;
	margin-bottom:0px;
	background: white;
}

.js-date-css{
	border:3px solid #ABABAB;
	/*background:#F2F5F5;*/
	background:white;
	padding:10px 20px;
	display:inline-block;
	margin-right: 12px;
	border-radius: 5px;
	font-size:12pt!important;
	font-weight: 550;
	line-height: 25px;
	margin-bottom:15px;
}

.js-date-css-selected{
	border:3px solid #004EA2;
	background:white;
	color:#004EA2;
}
.js-time-css-selected{
	border:3px solid #004EA2;
	background:white;
	color:#004EA2;
}

.js-disabled-button {
    pointer-events: none!important;
    opacity: 0.5!important; /* 선택적으로 투명도 설정 */
  }

.js-time-disabled{
    pointer-events: none!important;
    opacity: 0.5!important; /* 선택적으로 투명도 설정 */
}

.js-date-css:hover,.js-time-css:hover{
	background: #353535;
	color:white;
	border:3px solid #353535;
	font-weight: bold;
}



/* 캘린더 겉 박스 */
.js-week-selectbox{
	border:1px solid #F2F5F5;
	margin:20px 0;
}

.js-payment-button{
	border:3px solid #004EA2;
	border-radius:10px;
	padding:10px 20px;
	background: #004EA2;
	color:white;
	font-size:14pt;
}

.js-payment-button:hover{
	border:3px solid #004EA2;
	background: white;
	color:#004EA2;
}


.js-payment-box-font-css td:nth-child(1){
	font-size:14pt;
	font-weight: 500;
}
#js-pay-print{
	font-weight: bold;
}


/* ------------------- 여기는 결제전 확인하는 모달 -------------------- */
.payment_modal {
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

.payment_modal.show {
	display: block;
}

.payment_modal_body {
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

.payment_modal_body::-webkit-scrollbar {
  width: 10px;
  background-color: #f5f5f5;
  border-radius: 20px;
}
/* 스크롤 바 */
.payment_modal_body::-webkit-scrollbar-thumb {
  background-color: #888;
  border-radius: 2px;
}
/* 스크롤바에 hover 되는 경우 */
.payment_modal_body::-webkit-scrollbar-thumb:hover {
  background-color: #004EA2;
}

/* ------------------- 여기는 결제전 확인하는 모달 -------------------- */

.enter_payment_modal {
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

.enter_payment_modal.show {
	display: block;
}

.enter_payment_modal_body {
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





/* ------------모달 내 컨텐츠 css ---------------*/

.js-mentorInfopage-outerbox *{
	font-family: 'Noto Sans KR', sans-serif!important;
	color:#5D5D5D;
	font-size:11pt;
	text-align: left !important;
}

.js-mentorInfopage-outerbox{
	border:1px solid #E1E6E6;
	padding:30px 15px;
	border-right: none;
	border-left:none;
	border-bottom:none;
	align-content: left;
	align-items: left;
}

.js-mentorinfo-title{
	font-size:14pt!important;
	margin-bottom: 15px;
}

.js-mentorinfo-gray{
	color:#999999;
}

.js-mentorinfo-align-left span{
	text-align: left!important;
}

.js-modal-paymentbutt{
	margin-top:15px;
	font-family: 'Noto Sans KR', sans-serif!important;
	border:1px solid #004EA2;
	background: #004EA2;
	color:white;
	padding:5px 10px;
	border-radius: 5px;
}

.js-modal-paymentbutt:hover{
	border:2px solid #004EA2;
	background: white;
	color:#004EA2;
}

.js-modal-cancelbutt{
	position: absolute;
	top:20px;
	left:95%;
}

.bi-x-circle{
	font-color:#ABABAB;
	font-size:14pt;
}





.js-gitBlogSelectBox{
	padding-top:50px;
	font-size:11pt;
}

.js-gitBlogSelectBoxbox{
	padding-top:20px;
	font-size:11pt;
}

#js-gitgitgit,#js-blogblogblog{
	font-size:11pt;
	color:#BFBFBF;
}




/* ---------------- 첨부파일 관련 css ------------------ */


input[type=file]::file-selector-button {
   color: #f3f3f3;
   background-color: #222222;
   border: 1px solid gray;
   border-radius: 8px;
   cursor: pointer;
   padding: 8px 30px;
   display:inline!important;
}


.file_input{
	margin-top:10px;
}


.js_payment_img{
	width: 55px;
	height: 45px;
}
.js_payment_img_kakao{
	width: 60px;
	height: 30px;
}

</style>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>




// 30000 > 30,000 원
function addCommasToPrice(number) {
	  // 숫자를 문자열로 변환하여 쉼표를 추가한다.
	  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}


// 현재 시간을 구해오는 함수
function getCurrentTime() {
	  var currentDate = new Date();
	  var currentTime = currentDate.toLocaleTimeString();
	  return currentTime;
	}
	
	
	

	
	
	

$(document).ready(function(){
	
	
	
	
	
	// 시큐리티용 변수 
	var csrf = "${_csrf.headerName}";
	var csrfToken = "${_csrf.token}";
	
	

	// -----------------------
	

	
	
	// --------------   처음 로드될 때 disabled 시키기 위한 기본 unabled_date와 mentoring_time을 가져온다. 
	var schedule = JSON.parse('${schedule}');
	
	var weekday = schedule[0].split(',');  // 날짜 선택시 사용할 변수(array)
	var m_time = schedule[1].split(',');   // 시간 선택시 사용할 변수 (array)
	
	
	// 오늘 날짜로부터 7일 캘린더를 가져온다. 
	var today = new Date();

	// 7일 후의 날짜 계산
	var dateList = [];
	for (var i = 0; i < 7; i++) {
	  var currentDate = new Date();
	  currentDate.setDate(today.getDate() + i);
	  console.log(today.getDate() + i);
	  dateList.push(currentDate);
	}

	// 날짜를 'yy/dd 요일' 패턴으로 변환하여 <div> 태그에 넣기
	var container = $('.js-calendar-box');
	dateList.forEach(function(date) {
	  var formattedDate = date.toLocaleDateString('en-US', { year: 'numeric', month: '2-digit', day: '2-digit'});
	  console.log('formattedDate:'+formattedDate);
	  var weekweek = date.toLocaleDateString('ko-KR', {  weekday: 'short'});
	  
	  var dayday = date.toLocaleDateString('en-US', {  month: '2-digit', day: 'numeric' });

	  var div = document.createElement('div');
	  var weekdate;
	  
	  if (weekday.includes(weekweek)){
		  weekdate = $('<input>').attr({
		      type : 'button',
			  class : 'js-date-css js-disabled-button',
		      name : 'reserve_date',
		      value : weekweek+'\n'+dayday,
		      'data-value' : formattedDate
		   });
	  }else{
		  weekdate = $('<input>').attr({
		      type : 'button',
			  class : 'js-date-css',
		      name : 'reserve_date',
		      value : weekweek+'\n'+dayday,
		      'data-value' : formattedDate
		   });
	  }
	  

	  $('.js-calendar-box').append(weekdate);
	  //div.textContent = formattedDate;
	  //container.appendChild(div);
	});
	
	
	var hour = ['12','13','14','15','16','17','18'];
	var min = ['00','30'];

	function setTimeList(){
		for (var i = 0; i < hour.length; i++) {
	        for(var j = 0; j < min.length; j++){
	           if(hour[i]+':'+min[j] != '18:30'){
	           	
	           	
	           	if(m_time.includes(hour[i]+':'+min[j])){
		               var input = $('<input>').attr({
		                  type : 'button',
		                  class : 'js-time-css',
		                  name : 'mentoring_time',
		                  value : hour[i]+':'+min[j],
		               });
	           	}else{
		               var input = $('<input>').attr({
		                  type : 'button',
		                  class : 'js-time-css js-time-disabled',
		                  name : 'mentoring_time',
		                  value : hour[i]+':'+min[j],
		               });
	           	}
	           }
	           	
	           $('#js-time').append(input);
	        }
	     }
		
	}
	
   
	setTimeList();
	
	
	/* -------------------  멘토링 종류 선택 후 들어온 경우 ---------------------- */
	if('${kind}'!=null && '${kind}'!=''){
		
		
		$('.js-sel-radio[data-value="${kind}"]').prop('checked', true);
		// 맨 아래 가격 설정
		$("#js-pay-print").text(addCommasToPrice($('.js-sel-radio[data-value="${kind}"]').data('pay'))+' 원');
		
		var kind = '${kind}'; 
		var kind_num = parseInt(kind.substring(0,1));//2 or 3
																		  
		if(kind_num == 3){
		  //당일 버튼을 막는다. 
		  if(! $('.js-calendar-box :first-child').hasClass('js-disabled-button')){ 						//-----------------------여기 변경해야함ㅏㅓㅓ
		  	  alert("30분 대면 멘토링이 선택 돼 있음. disabled 날짜가 아니기 때문에 오늘 날짜는 disabled한다. ");
		  
		  	var classCount = document.getElementsByClassName('js-calendar-box :first-child').length;
		  	alert("갯수 : "+classCount);
		  
		  	$('.js-calendar-box :first-child').addClass('js-disabled-button');
			  alert("됨");
		  }
		}		
		
	}
	
	
	
	/* --------------------------  멘토링 종류 선택시  ------------------------ */
	
	$('.js-sel-radio').change(function() {
		  
		if ($(this).is(':checked')) {
		    $("#js-pay-print").text($(this).data('pay')+' 원');
		    $("#js-final-price").text($(this).data('pay')+' 원');
		  }
		  
		  // 30분 대면 멘토링이면 당일 예약을 막는다. 
		  var kind = $(this).data('value');
		  var kind_num = parseInt(kind.substring(0,1));  //2 or 3
				  
			if(kind_num == 3){
			  //당일 버튼을 막는다. 
			  if(! $('.js-calendar-box :first-child').hasClass('js-disabled-button')){
			  	  alert("30분 대면 멘토링 선택 > disabled 안 돼 있어서 막습니다. ");
			  	$('.js-calendar-box :first-child').addClass('js-disabled-button');
			  }
			}else{
			  	$('.js-calendar-box :first-child').removeClass('js-disabled-button');
			}	
		  
		  
	});
	
	
	
	
	
	// -------- 날짜 버튼 클릭시 
	
	$(".js-date-css").click(function(){
		
		/*
		if($('.js-sel-radio[checked=true]').length==0){
			alert("멘토링 종류를 먼저 선택해주세요 !");
			return false;
		}
		*/
		if($('input[type="radio"][name="mentoring_kind"]:checked').length==0){
			alert("멘토링 종류를 먼저 선택해주세요 !");
			return false;
		}
		
		
		$(".js-date-css").removeClass('js-date-css-selected');
		$(this).addClass("js-date-css-selected");
		$("#reserve_day").val($(this).data("value"));
		
		$('#js-time').html('');
		setTimeList(); // 일단 타임 칸을 한번 리셋해준다. 
		
		var selecteddate = $(this).data('value');
		var mentor_no = ${mentor_no};
		
		$.ajax({
			  url: '/findMentor/getReservedTime',
			  method: 'POST', 
			  data: { 
				  reserve_date : selecteddate,
				  mentor_no : mentor_no
				  }, 
			  beforeSend: function(xhr){
            	xhr.setRequestHeader(csrf,csrfToken);
              },
			  success: function(rsp) {
				  
				  
				  console.log("rsp:"+rsp);
				  if(rsp!=null){
					  for(var i=0;i<rsp.length;i++){
						  $('.js-time-css[value="'+rsp[i]+'"]').addClass('js-time-disabled');
						  console.log("rsp[i]: "+rsp[i]);
					  }
				  }
				  
			  },
			  error: function(xhr, status, error) {
			    console.log('날짜 클릭시 보내는 ajax 요청 실패');
			    console.log(error); 
			  }
		});
		
		
		
	//  **********   만약 당일 예약을 클릭하면 5시간 이내는 선택 못하게 disabled 한다. 
		  var kind = $('input[type="radio"][name="mentoring_kind"]:checked').data('value'); //2 or 3
		  var kind_num = parseInt(kind.substring(0,1));
	      var currentT = getCurrentTime();
	      var index = $('.js-date-css').index(this) + 1;
		  console.log("kind_num:"+kind_num);
		  console.log("currentT:"+currentT);
	      console.log("index= "+index);
		  // 여기서 전화 멘토링 5시간 전 js-time-css 버튼을 disabled 한다. 
		  if(kind_num == 2 && index == 1){
			  
			  alert("여기 들어와?");
			// 현재 시간 가져오기
			  var currentTime = new Date();

			  // 현재 시간에서 5시간 후의 시간 계산
			  var fiveHoursLater = new Date();
			  fiveHoursLater.setHours(currentTime.getHours() + 5);

			  // 모든 해당 태그 선택
			  var tags = document.querySelectorAll('.js-time-css');
			  // 각 태그의 value 값 확인하여 조건에 따라 disabled 설정
			  tags.forEach(function(tag) {
			    var value = tag.value;
			    
			    // 시간 값 추출 (예: "12:30"에서 "12"와 "30" 추출)
			    var parts = value.split(':');
			    var tagTime = new Date();
			    tagTime.setHours(parts[0]);
			    tagTime.setMinutes(parts[1]);
			    
			    var tagtime = new Date(tagTime);
			    var dateObject = new Date(fiveHoursLater);
			    var timestamp1 = dateObject.getTime();
			    var timestamp2 = tagtime.getTime();
			    
			    console.log('tagTime:'+timestamp1);
			    console.log('dateObject:'+timestamp2);
			    // 현재 시간과 5시간 이내의 시간 비교하여 disabled 설정
			    if (timestamp2 <= timestamp1) {
			    	console.log("아니 왜 안돼 ㅋ");
					if(!tag.classList.contains("js-time-disabled")){
						  tag.classList.add("js-time-disabled");
					  }
			   }
			  })    
			  
		  }			
		//  **********   끝 

		
		
		
		
		
		
	}); // click(function(){}) end	
	

	/* --------------------------  깃허브 , 블로그 주소 ------------------------ */
	
	
	// 처음 페이지 로드시 깃허브,블로그 주소 비공개 체크
	$("#js-blogclose").prop("checked","checked");
	$("#js-gitclose").prop("checked","checked");
	
	$("#js-gitgitgit").hide();
	$("#js-blogblogblog").hide();
	
	// 깃 주소 라디오 박스 클릭이벤트 발생시 
	$(".js-gitview").click(function(){
		if($(this).attr('id')=='js-gitopen'){
			$("#js-gitgitgit").show();
			$("#js-menteegit").val('${mentee.git}');
		}else{
			$("#js-gitgitgit").hide();
			$("#js-menteegit").val('');
		}
	});

	// 깃 주소 라디오 박스 클릭이벤트 발생시 
	$(".js-blogview").click(function(){
		if($(this).attr('id')=='js-blogopen'){
			$("#js-blogblogblog").show();
			$("#js-menteeblog").val('${mentee.blog}');
		}else{
			$("#js-blogblogblog").hide();
			$("#js-menteeblog").val('');
		}
	});
	
	

	
	$("#js-mentoring-comment").keyup(function(){
		
		var leng = $("#js-mentoring-comment").val().length;
		if(leng != 0){
			$("#js-textlength-view").text(leng+'자/최대 1000자');
		}else{
			$("#js-textlength-view").text('0자/최대 1000자');
		}
		
	});
	
   
	
	
	/*
	$(".js-time-css").click(function(){
		alert("되라진짜");
		
		$(".js-time-css").removeClass('js-time-css-selected');
		$(this).addClass("js-time-css-selected");
		$("#reserve_time").val($(this).val());
		alert($("#reserve_time").val());
	});
    */
    
	$(document).on("click", ".js-time-css", function() {
		
		
		if($(".js-date-css-selected").length == 0){
			alert("예약 날짜를 먼저 선택해주세요. ");
			return false;
		}

	    $(".js-time-css").removeClass('js-time-css-selected');
	    $(this).addClass("js-time-css-selected");
	    $("#reserve_time").val($(this).val());
	    alert($("#reserve_time").val());
	});


    

	


	
	
});


 // 결제 버튼 클릭시 
function goPaymentbox(){
	 
	 
	if($('input[type="radio"][name="mentoring_kind"]:checked').length==0){
		alert("멘토링 종류를 선택해주세요.");
		$('input[type="radio"][name="mentoring_kind"]').focus();
		return false;
	} 
	 
	if($(".js-date-css-selected").length == 0){
		alert("예약 날짜를 선택해주세요. ");
		$(".js-date-css").focus();
		return false;
	}

	if($(".js-time-css-selected").length == 0){
		alert("예약 시간을 선택해주세요. ");
		$(".js-time-css").focus();
		return false;
	}
	
	if($.trim($("#js-mentoring-comment").val()).length == 0){
		alert("멘토링 받고 싶은 내용을 작성해주세요. ");
		$("#js-mentoring-comment").focus();
		return false;
	}
	
	var mentoring_kind = $('input[type="radio"][name="mentoring_kind"]:checked').data('value');
	var reserve_day = $("#reserve_day").val();
	var reserve_time = $("#reserve_time").val();
	var mentor_no = ${mentor_no};
	var git = $("#js-menteegit").val();
	var blog = $("#js-menteeblog").val();
	var amount = $('input[type="radio"][name="mentoring_kind"]:checked').data('pay');
	alert("결제 전 넘기는 변수 \n "+mentoring_kind+"\n"+reserve_day+"\n"+reserve_time+"\n"+mentor_no+"\n"+amount);
	
	
	// ajax로 현재 선택한 멘토링 kind에 대한 정보를 구해와서 모달 div 사이에 넣는다. 
	$.ajax({
		
		  url: '/findMentor/getPaymentInfo',
		  method: 'GET', 
		  data: { mentoring_kind : mentoring_kind,
			  reserve_day : reserve_day,
			  reserve_time : reserve_time,
			  mentor_no : mentor_no,
			  git : git,
			  blog : blog,
			  amount : amount
		  },
/* 		  beforeSend: function(xhr){
       		xhr.setRequestHeader(csrf,csrfToken);
          }, */
		  success: function(rsp) {
			  
			  $("#selected_mentor_info_box").html(rsp);
			  var amount = $("#js-pay-print").text(addCommasToPrice($('.js-sel-radio[data-value="${kind}"]').data('pay'))+' 원');
			  $("#js-final-price").html(amount);
			  
		  },
		  error: function(xhr, status, error) {
		    console.log(error); 
		  }
		});

	
	openPaymentModal();
	
	
}

 
//모달 영역
function openPaymentModal() {
    const modal = document.querySelector('.payment_modal');
    var amount = $('input[type="radio"][name="mentoring_kind"]:checked').data('pay');
    $("#js-final-price").html(amount);
    alert("amount:"+amount);
    modal.style.display = 'block';
}

function closePaymentModal(){
    const modal = document.querySelector('.payment_modal');
    modal.style.display = 'none';
    
}


// iamport 결제 모달을 띄운다. 
function openEnterPayment(){
	
	closePaymentModal();
  //  const modal = document.querySelector('.enter_payment_modal');
  //  modal.style.display = 'block';
	    
	
}
function closeEnterPayment(){
	
  //  const modal = document.querySelector('.enter_payment_modal');
  //  modal.style.display = 'none';
	
}


//고유한 주문번호 생성하기
function createOrderNum(){
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");
	
	let orderNum = year + month + day;
	for(let i=0;i<10;i++) {
		orderNum += Math.floor(Math.random() * 8);	
	}
	
    alert("주문번호:"+orderNum);
	return orderNum;
}


//--------------------결제를 위한 영역
function requestPay() {

	// 시큐리티용 변수 
	var csrf = "${_csrf.headerName}";
	var csrfToken = "${_csrf.token}";
	var file_no = '';
	
	
	// 파일 정보를 가져다 놓는다. 
	var form = $('#js-file-insert-form')[0];
    var formData = new FormData(form);
	
	$.ajax({
	      url: form.action,
	      type: 'POST',
	      data: formData,
	      processData: false,
	      contentType: false,
	      enctype : 'multipart/form-data',
	      beforeSend: function(xhr){
	      	xhr.setRequestHeader(csrf,csrfToken);
	      },
	      success: function(response) {
	    	  console.log("멘토링 신청시 실행하는 파일 업로드 성공");
	    	  file_no = response;
	      },
	      error: function(xhr, status, error) {
	    	  console.log("멘토링 신청시 첨부한 파일 저장 실패");
	      }
	    });
	
	console.log("파일까지 저장함");
	
	
	
	// 파일 업로드 처리하는 코드 들어와야함 ( 콜백으로 file_no  가져와서 mentoring table insert시 넣어주기 )
	var git = $("#js-menteegit").val();
	var blog = $("#js-menteeblog").val();
	var pgName = $("input[type='radio'][name='pgName']:checked").val();
	var name = $('input[type="radio"][name="mentoring_kind"]:checked').data('value');
	var amount = $('input[type="radio"][name="mentoring_kind"]:checked').data('pay');
	
	alert("name :"+name);
	alert("amount :"+amount);
	closePaymentModal()// 기존 모달 닫기
  //      pg: 'kakaopay',danal_tpay
	
    // IMP.request_pay(param, callback) 결제창 호출
    var uid = '';
    IMP.init("imp04314513");
    IMP.request_pay({ // param
        pg:pgName,
    	pay_method: "card",
        merchant_uid: createOrderNum(), //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: name, //결제창에 노출될 상품명
        amount: amount, //금액
        buyer_email : '${mentee.email}', 
        buyer_name : '${mentee.name}',
        buyer_tel : '${mentee.phone}',
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            uid = rsp.imp_uid;
            console.log('1번 '+JSON.stringify(rsp));
            console.log('2번 '+rsp);
    
    
            // 결제검증
            $.ajax({
                url: '/payment/order/verify_iamport/' + rsp.imp_uid,
                type: 'post',
                beforeSend: function(xhr){
                	xhr.setRequestHeader(csrf,csrfToken);
                }
            }).done(function(data) {
                // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
                if (amount == data.response.amount) {
                	console.log("결제한거 저장까지 함");
                	
       /*         	var git_yn = $('input[type="radio"][class="js-gitview"]:checked').val();
                	var blog_yn = $('input[type="radio"][class="js-blogview"]:checked').val();
                	alert("git_yn = "+git_yn);
                	alert("git_yn null인가? "+git_yn==null);
                	alert("blog_yn = "+blog_yn==null);
       */         	
       
       			var gityn = $('input[type="radio"][class="js-gitview"]:checked').val();
       			var blogyn = $('input[type="radio"][class="js-blogview"]:checked').val();
       			
       				if(gityn != 'N' && gityn != 'Y'){
       					gityn = null;
       				}	
       				if(blogyn != 'N' && blogyn != 'Y'){
       					blogyn = null;
       				}	
       
                	
                    // jQuery로 HTTP 요청
                    // 주문정보 생성 및 테이블에 저장 
		        	
                        // 데이터를 json으로 보내기 위해 바꿔준다.
                        requestData = JSON.stringify({
                        	"payment_method" : rsp.pay_method, 
                            "order_no" :  rsp.merchant_uid,
                            "pay_amount" : rsp.paid_amount,
                            "pay_state" : rsp.status,
                            "pay_time" : new Date().getTime(),
                            "iamport_order_no" : rsp.imp_uid,
                            "buyer_name" : rsp.buyer_name,
                            "buyer_email" : rsp.buyer_email,
                            "buyer_phone" : rsp.buyer_tel,   //여기까지가 PaymentDTO
                            "request_content" : $("#js-mentoring-comment").val(),
                            "apply_time" : new Date().getTime(),
                            "classification" : 31,
                            "mentee_no" : "${mentee.mentee_no}",
                            "file_no" : file_no,
                            "reserve_day" : $("#reserve_day").val(),
                            "reserve_time" : $("#reserve_time").val(),
                            "service_no" : $('input[type="radio"][name="mentoring_kind"]:checked').val(),
                            "git_yn" : gityn,
                            "blog_yn" : blogyn
                            	
                        });
                    
                    console.log("requestData:"+requestData);
					
                        $.ajax({
                            url: "/payment/order/complete", 
                            type: "POST",
                            dataType: 'json',
                            contentType: 'application/json',
                            beforeSend: function(xhr){
                            	xhr.setRequestHeader(csrf,csrfToken);
                            },
                            data : requestData,
                        }).done(function(res) {
                        	
                        	
                            if (res > 0) {
                                alert('결제가 완료되었습니다. ');
                                console.log(res);
                                var mentor_no = ${mentor_no};
                                
                                location.href="/findMentor/mentoringApplyMsg?payment_no="+res+"&mentor_no="+mentor_no;
                                $("#paySuccess").append("<a href='/payment/refund?payment_no="+res+"'>결제취소</a>");             
                                //createPayInfo(uid);
                            }
                            else {
                            	console.log('주문정보 저장 실패');
                            }
                        })
                }
                else {
                    alert('결제가 취소되었습니다. ');
                }
            })
            
            //제일위쪽 if에 대한 else
            } else {
                alert("결제가 취소되었습니다.");
            }
    
    
        }); // 내부 function 끝
}




//******************************************[파일 처리 start]**********************************************
//아래 function 호출해서 사용하기

//파일 선택
function selectFile(element) {

 const file = element.files[0];
 const filename = element.closest('.file_input').firstElementChild;

 // 1. 파일 선택 창에서 취소 버튼이 클릭된 경우
 if ( !file ) {
     filename.value = '';
     return false;
 }

 // 2. 파일 크기가 10MB를 초과하는 경우
 const fileSize = Math.floor(file.size / 1024 / 1024);
 if (fileSize > 10) {
     alert('10MB 이하의 파일로 업로드해 주세요.');
     filename.value = '';
     element.value = '';
     return false;
 }

 // 3. 파일명 지정
 filename.value = file.name;
}


//파일 추가
function addFile() {
 const fileDiv = document.createElement('div');
 fileDiv.innerHTML =`
     <div class="file_input">
         <input type="text" readonly />
         <label>
             <input type="file" name="files" onchange="selectFile(this);" />
         </label>
         <i class="bi bi-dash-circle fs-3 " onclick="removeFile(this);" style="color:#A50000;"></i>
     </div>
 `;
 document.querySelector('.file_list').appendChild(fileDiv);
}

//     <button type="button" onclick="removeFile(this);" class="small_jh btn_jh add_btn"><span>삭제</span></button>

//파일 삭제
function removeFile(element) {
 const fileAddBtn = element.nextElementSibling;
 if (fileAddBtn) {
     const inputs = element.previousElementSibling.querySelectorAll('input[type="file"]');
     inputs.forEach(input => input.value = '')
     return false;
 }
 element.parentElement.remove();
}

//******************************************[파일 처리 end]**********************************************
</script>

</head>
	



<input type="hidden" name="reserve_day" id="reserve_day">
<input type="hidden" name="reserve_time" id="reserve_time">
<input type="hidden" name="blog" id="js-menteeblog">
<input type="hidden" name="git" id="js-menteegit">


<%@ include file="../public/header.jsp" %>




	<%-- 결제 클릭시 띄우는 모달 영역 --%>
	<div class="payment_modal">
      <div class="payment_modal_body" align=center>
    
        <div id="selected_mentor_info_box" align=center></div>
    
    	<div class="js-modal-cancelbutt" onclick="closePaymentModal();">
    	<i class="bi bi-x-circle"></i>
    	</div>    
			<br><br>

    		<input type=button value="결제하기" class="js-modal-paymentbutt" onclick="requestPay();">   
    	 
      </div>
    </div>
	
	
	
	<%-- iamport 모달  --%>     <%--   ★★★★★★★★★★★★★★★★★★★★★★★★★★★★ 머지 후 추가할 부분 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★     --%>
	<div class="enter_payment_modal">
      <div class="enter_payment_modal_body" align=center>
      </div>
    </div>
    <%--      ********************        모달 끝 !!!         ***********************         --%>
    
    
    

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
        	<div class="row">
        
        
            <div class="col-2"></div>
            
            
            <div class="col-8" >
            <%-- 여기 하위가 작업공간 --%>
          
          <div id="paySuccess"></div>
          
          
            <div class="js-applypage-Contentbox">
            
            
           
            <%--멘토링 선택 --%>
            <div class="js-selectbox-kind">
            	<span class="js-selectbox-font-L">멘토링 선택</span>
            	<table class="js-paymentbottommargin2-parent">
		      			<c:forEach var="i" items="${payment }" varStatus="st">
							<tr class="js-paymentbottommargin2">
								<th width="10%">
                                    <input type="radio" name="mentoring_kind" id="js-mentoring-${st.index}" class="js-sel-radio" value="${i.service_no }" data-value="${i.mentoring_kind}" data-pay="${i.mentoring_fee }">
	 							</th>
								<td>
									<div class="js-mentoring-kindbox2">${i.mentoring_kind }</div>
								</td>		      			    
								<td style="font-size:14pt;">
									<fmt:formatNumber value="${i.mentoring_fee }" type="number" var="pay" /><b>${pay}</b> 원
								</td>	
		      			 	</tr>
		      			</c:forEach>
		      	</table>
            </div>




            <%--날짜선택 --%>
            <div class="js-selectbox-kind">
            	<div class="js-selectbox-font-L">날짜 선택</div>
					<div class="js-week-selectbox">
						<div class="js-calendar-box"></div>
					</div>


            </div>





            <%--시간선택 --%>
            <div class="js-selectbox-kind">
            	<span class="js-selectbox-font-L">시간 선택</span>
            	<div class="js-time-selectbox">	
            		<div id="js-time"></div>
            	</div>
            
            </div>




          
            <%--상담 내용--%>
            <div class="js-selectbox-kind">
            	<table class="js-writebox">
            		<tr>
            		<td colspan="2">
            			<span class="js-selectbox-font-L">멘토링 받고 싶은 내용 작성</span>
            		</td>
            		</tr>
            		<tr>
            		<td colspan="2" align="right">
            			<span class="js-selectbox-font-mini" id="js-textlength-view">0자/최대 1000자</span>
            		</td>
            		</tr>
					<tr>
					<td colspan="2">
		            	<textarea class="form-control" rows="7" id="js-mentoring-comment" placeholder="궁금한 질문을 작성해주세요 !" maxlength="1000"
		            	 style="resize: none;"></textarea>
					</td>
					</tr>            	
            	 	<c:if test="${ ! empty mentee }">

	            	 	<c:if test="${ ! empty mentee.git }">
		            	 	<tr>
		            	 	<th class="js-gitBlogSelectBox">
				            	깃허브 주소 &nbsp;&nbsp;&nbsp;
				            	공개 <input type="radio" name="js-gitview" class="js-gitview" id="js-gitopen" value="Y">&nbsp;&nbsp; 
				            	비공개 <input type="radio" name="js-gitview" class="js-gitview" id="js-gitclose" value="N"> 
		            	 	</th>
		            	 	<td style="padding-top:50px;"> <span id="js-gitgitgit">${mentee.git }</span></td>
		            	 	</tr>
	            	 	</c:if>

	            	 	<c:if test="${ ! empty mentee.blog }">
		            	 	<tr>
		            	 	<th class="js-gitBlogSelectBoxbox">
				            	블로그 주소 &nbsp;&nbsp;&nbsp;
				            	공개 <input type="radio" name="js-blogview" class="js-blogview" id="js-blogopen" value="Y">&nbsp;&nbsp; 
				            	비공개 <input type="radio" name="js-blogview" class="js-blogview" id="js-blogclose" value="N"> 
		            	 	</th>
		            	 	<td style="padding-top:50px;"> <span id="js-blogblogblog">${mentee.blog }</span></td>
		            	 	</tr>
	            	 	</c:if>
	            	 	
	            	 	
	            	 	<tr>
	            	 	<td>
							<form action="insertMentoring_file" id="js-file-insert-form" autocomplete="off" enctype="multipart/form-data">	            	 	
	            	 	
								<!-- 파일 첨부 -->
								<div class="file_list cont_mar" style=" margin-top: 20px;width:100%;">
									<div class="file_input"  style="display:inline;">
										<input type="text" readonly="readonly"> 
										<label>
											<input type="file" name="files" id="js-file-upload-button" onchange="selectFile(this);" accept=".jpg,.jpeg,.png,.docx,.pdf">
										</label>
									</div>
									<!-- <input type="button" onclick="removeFile(this);" value="삭제"> -->
									<!-- <input type="button" onclick="addFile();" value="파일추가" > -->
									<i class="bi bi-dash-circle fs-3 " onclick="removeFile(this);" style="color:#A50000;"></i>
									<i class="bi bi-plus-circle fs-3 " onclick="addFile();" style="text-align: right;color:#004EA2;margin-left:8px;"></i>
								</div>
	
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- 저장 btn -->
 							</form>
						</td>
	            	 	</tr>

            	 	</c:if>
            	</table>
            </div>
          
          
          
          
          
            <%--멘토 정보--%>
            <div class="js-selectbox-kind">
            
            </div>




			<div>
			<table width="100%" class="js-payment-box-font-css">
			<tr>
			
				<td>결제 금액 <span id='js-pay-print'></span></td>
				
				<td align="right">
					<input type=button value="예약하기" class="js-payment-button" onclick="goPaymentbox();">
				</td>
			
			</tr>
			</table>
			</div>          
          	
          
          
          
          
          
          
          
            </div>
            
 			<%-- 작업공간 끝 --%>
            </div>
            
            
            
            
            <div class="col-2"></div>
            
            </div>
        </div>

<%@ include file="../public/footer.jsp" %>        









