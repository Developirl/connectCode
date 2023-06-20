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
	background: #F2F7F7;
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
	font-weight: 300;
	color:#737373;
}
.js-mentoring-kindbox2{
    border:2px solid #004EA2;
    background:#F2F7F7;
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
	border:3px solid #ccc;
	background:#F2F7F7;
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
}

.js-date-css{
	border:3px solid #ccc;
	background:#F2F7F7;
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
    pointer-events: none;
    opacity: 0.5; /* 선택적으로 투명도 설정 */
  }

.js-time-disabled{
    pointer-events: none;
    opacity: 0.5; /* 선택적으로 투명도 설정 */
}

.js-date-css:hover,.js-time-css:hover{
	background: white;
}



/* 캘린더 겉 박스 */
.js-week-selectbox{
	border:1px solid #F2F7F7;
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
	font-color:#ccc;
	font-size:14pt;
}
</style>


<script>





function addCommasToPrice(number) {
	  // 숫자를 문자열로 변환하여 쉼표를 추가합니다.
	  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}



$(document).ready(function(){
	

	
	$('.js-sel-radio').change(function() {
		  if ($(this).is(':checked')) {
		    $("#js-pay-print").text($(this).data('pay')+' 원');
		  }
		});

	
	
	
	// 시큐리티용 변수 
	var csrf = "${_csrf.headerName}";
	var csrfToken = "${_csrf.token}";
	
	
	
	var hour = ['12','13','14','15','16','17','18'];
	var min = ['00','30'];
	
	

	
	// 처음 로드될 때 가격으로 예약하기로 들어온 경우 해당 멘토링 kind 체크
	if('${kind}'!=null && '${kind}'!=''){
		$('.js-sel-radio[data-value="${kind}"]').prop('checked', true);
		//$("#js-pay-print").text($('.js-sel-radio[data-value="${kind}"]').data('pay')); // ------------------- 여기 변경해야함
		$("#js-pay-print").text(addCommasToPrice($('.js-sel-radio[data-value="${kind}"]').data('pay'))+' 원'); // ------------------- 여기 변경해야함
	}
	
	// 처음 로드될 때 disabled 시키기 위한 기본 unabled_date와 mentoring_time을 가져온다. 
	var schedule = JSON.parse('${schedule}');
	
	var weekday = schedule[0].split(',');  // 날짜 선택시 사용할 변수(array)
	var m_time = schedule[1].split(',');   // 시간 선택시 사용할 변수 (array)
	
	
	// 오늘 날짜로부터 7일 캘린더를 가져온다. 

	// 현재 날짜를 가져오기
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
			  method: 'POST', // HTTP 요청 메서드 (GET, POST, 등)
			  data: { reserve_date : selecteddate,
				  mentor_no : mentor_no }, // 요청 데이터 (선택적)
			  beforeSend: function(xhr){
            	xhr.setRequestHeader(csrf,csrfToken);
              },
			  success: function(rsp) {
				  
				  if(rsp!=null){
					  for(var i=0;i<rsp.length;i++){
							  
						  
						  $('.js-time-css[value="'+rsp[i]+'"]').addClass('js-time-disabled');
						  
						  /* if($(".js-time-css").val()==rsp[i]){
							  $(".js-time-css").addClass('js-time-disabled');
							  alert("클래스 추가 성공 ㅋㅋㅋㅋㅋ");
						  }  */
						  
					  }
				  }
				  
			  },
			  error: function(xhr, status, error) {
			    console.log('날짜 클릭시 보내는 ajax 요청 실패');
			    console.log(error); 
			  }
			});

		
		
	});
	
	


// [상담 가능한 시간] 버튼 출력
setTimeList();
     /*  for (var i = 0; i < hour.length; i++) {
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
       */

	
	$("#js-mentoring-comment").keyup(function(){
		
		var leng = $("#js-mentoring-comment").val().length;
		if(leng != 0){
			$("#js-textlength-view").text(leng+'자/최대 1000자');
		}else{
			$("#js-textlength-view").text('0자/최대 1000자');
		}
		
	});
	
	
	
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
	alert("결제 전 넘기는 변수 \n "+mentoring_kind+"\n"+reserve_day+"\n"+reserve_time+"\n"+mentor_no);
	
	
	// ajax로 현재 선택한 멘토링 kind에 대한 정보를 구해와서 모달 div 사이에 넣는다. 
	$.ajax({
		
		  url: '/findMentor/getPaymentInfo',
		  method: 'GET', 
		  data: { mentoring_kind : mentoring_kind,
			  reserve_day : reserve_day,
			  reserve_time : reserve_time,
			  mentor_no : mentor_no  
		  },
/* 		  beforeSend: function(xhr){
       		xhr.setRequestHeader(csrf,csrfToken);
          }, */
		  success: function(rsp) {
			  
			  $("#selected_mentor_info_box").html(rsp);
			  
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
    modal.style.display = 'block';
}

function closePaymentModal(){
    const modal = document.querySelector('.payment_modal');
    modal.style.display = 'none';
}


// iamport 결제 모달을 띄운다. 
function openEnterPayment(){
	
	closePaymentModal();
	
}




</script>

</head>
	



<input type="hidden" name="reserve_day" id="reserve_day">
<input type="hidden" name="reserve_time" id="reserve_time">


<%@ include file="../public/header.jsp" %>




	<%-- 결제 클릭시 띄우는 모달 영역 --%>
	<div class="payment_modal">
      <div class="payment_modal_body" align=center>
    
        <div id="selected_mentor_info_box" align=center>
        </div>
    
    	<div class="js-modal-cancelbutt" onclick="closePaymentModal();">
    	<i class="bi bi-x-circle"></i>
    	</div>    
    	
    	<input type=button value="결제하기" class="js-modal-paymentbutt" onclick="openEnterPayment()">   
    	 
      </div>
    </div>
	<%-- iamport 모달  --%>
	<div class="enter_payment_modal">
      <div class="enter_payment_modal_body" align=center>
 				이게 맞냐 ~?   
    	 
      </div>
    </div>
    <%--      ********************        모달 끝 !!!         ***********************         --%>
    
    
    

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
        	<div class="row">
        
        
            <div class="col-2"></div>
            
            
            <div class="col-8" >
            <%-- 여기 하위가 작업공간 --%>
          
          
          
          
            <div class="js-applypage-Contentbox">
            
            
           
            <%--멘토링 선택 --%>
            <div class="js-selectbox-kind">
            	<span class="js-selectbox-font-L">멘토링 선택</span>
            	<table class="js-paymentbottommargin2-parent">
		      			<c:forEach var="i" items="${payment }" varStatus="st">
							<tr class="js-paymentbottommargin2">
								<th width="10%">
                                    <input type="radio" name="mentoring_kind" id="js-mentoring-${st.index}" class="js-sel-radio" data-value="${i.mentoring_kind}" data-pay="${i.mentoring_fee }">
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
            	<div class=".js-time-selectbox">	
            		<div id="js-time"></div>
            	</div>
            
            </div>




          
            <%--상담 내용--%>
            <div class="js-selectbox-kind">
            	<table class="js-writebox">
            		<tr>
            		<td >
            			<span class="js-selectbox-font-L">멘토링 받고 싶은 내용 작성</span>
            		</td>
            		</tr>
            		<tr>
            		<td align="right">
            			<span class="js-selectbox-font-mini" id="js-textlength-view">0자/최대 1000자</span>
            		</td>
            		</tr>
            	</table>
            	
            	<textarea class="form-control" rows="7" id="js-mentoring-comment" placeholder="궁금한 질문을 작성해주세요 !" maxlength="1000"
            	 style="resize: none;"></textarea>
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









