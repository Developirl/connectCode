var idchkbtn = false;
var passchkbtn = false;
var phoneBtnChk = false;
var certifyBtnChk = false;
var phoneCertifyChk = false;
var idRule = /^(?=.*[a-zA-Z])[\da-zA-Z]{8,16}$|^\d{8,16}$/; // 알파벳 대소문자와 숫자가 포함된 경우와 숫자만 써도됨
var passRule = /^(?=.*\d)[\d+!@#$%^&a-zA-Z]{6,16}$/;
//최소한 한 개의 숫자가 포함된 문자열을 허용하고, 숫자, 특수문자(+!@#$%^&), 알파벳 대소문자
var emailRule = /^[\w.-]+@(gmail\.com|naver\.com|nate\.com|daum\.net)$/;
//모든 문자, 숫자, 밑줄(_), 마침표(.), 하이픈(-), gmail.com, naver.com, nate.com, daum.net 중 하나와 일치해야함


//ID 정규식
function validate_userid(id) {
	var pattern = new RegExp(/^(?=.*[a-zA-Z])[\da-zA-Z]{8,16}$|^\d{8,16}$/); // 알파벳 대소문자와 숫자가 포함된 경우와 숫자만 써도됨
	return pattern.test(id); // 반환값 true, false
};

// 비밀번호 정규식
function validate_userpass(password) { //최소한 한 개의 숫자가 포함된 문자열을 허용하고, 숫자, 특수문자(+!@#$%^&), 알파벳 대소문자
	var pattern = new RegExp(/^(?=.*\d)[\d+!@#$%^&a-zA-Z]{6,16}$/); 
	
	return pattern.test(password);
};

// email 정규식
function validate_useremail(email) { //모든 문자, 숫자, 밑줄(_), 마침표(.), 하이픈(-), gmail.com, naver.com, nate.com, daum.net 중 하나와 일치해야함
	var pattern = new RegExp(/^[\w.-]+@(gmail\.com|naver\.com|nate\.com|daum\.net)$/);
	return pattern.test(email); // 반환값 true, false
};	

//은행 정규식
function validate_userbank(customBankValue) { // 이 은행들만 가능하게 정규식을 쓴다.
	var pattern = new RegExp(/^(신한은행|국민은행|기업은행|농협은행|산업은행|수협은행|신협은행|우리은행|하나은행|한국씨티은행|카카오뱅크|케이뱅크|토스뱅크|경남은행|광주은행|대구은행|부산은행|전북은행|제주은행|새마을은행|우체국은행|저축은행)$/);
	return pattern.test(customBankValue); // 반환값 true, false
};


//이메일 확인
function emailchk(){
	
$('#domain','#email').blur()
	  
	  var email = $("#email").val();
	  
	  if(!(validate_useremail(email))){
		var newtext = '<font color="red">모든 문자,숫자,밑줄(_),마침표(.),하이픈(-),@포함하고,(gmail.com,naver.com,nate.com,daum.net만 허용)</font>';
		  $("#emailcheck").text('');
		  $("#emailcheck").append(newtext);
		  $("#emailcheck").show();
	  }else{
		  var newtext = '<font color="green">사용 가능한 email입니다.</font>';
		  $("#emailcheck").text('');
		  $("#emailcheck").append(newtext);
		  $("#emailcheck").show();
	  }
	
};

function check(){
	if ($.trim($("#id").val()) == "") {
		alert("ID를 입력하세요.");
		$("#id").focus();
		return false;
	}
	if (idchkbtn == false) {
		alert("ID 중복검사 버튼을 눌러주세요.");
		$("#id").focus();
		return false;
	}
	if ($.trim($("#password").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#passwd").val("").focus();
		return false;
	}
	if ($.trim($("#password2").val()) == "") {
		alert("비밀번호 확인을 입력하세요.");
		$("#passwd2").val("").focus();
		return false;
	}
	if (passchkbtn == false) {
		alert("비밀번호 확인 버튼을 눌러주세요.");
		$("#password").focus();
		return false;
	}
	if ($.trim($("#name").val()) == "") {
		alert("이름을 입력하세요.");
		$("#name").val("").focus();
		return false;
	}
	if ($("#male").is(":checked") == false
			&& $("#female").is(":checked") == false) {
		alert("성별을 선택하세요");
		return false;
	}
	if ($.trim($("#changebirthday").val()) == "") {
		alert("생일을 입력하세요.");
		$("#changebirthday").val("").focus();
		return false;
	}
	if ($.trim($("#email").val()) == "") {
		alert("이메일을 입력하세요.");
		$("#email").val("").focus();
		return false;
	}
	if ($.trim($("#mentoring_location").val()) == "") {
		alert("주소를 입력하세요.");
		$("#mentoring_location").val("").focus();
		return false;
	}
	if ($.trim($("#phone").val()) == "") {
		alert("휴대폰 번호를 입력하세요.");
		$("#phone").val("").focus();
		return false;
	}
	if (isNaN($("#phone").val())) {
		alert("숫자만 입력하세요");
		$("#phone").val("").focus();
		return false;
	}
	if (phoneBtnChk == false) {
		alert("휴대폰 인증번호 전송을 눌러주세요.");
		$("#phone_certify").focus();
		return false;
	}
	if ($.trim($("#phone_certify").val()) == "") {
		alert("휴대폰 인증번호를 입력하세요.");
		$("#phone_certify").focus();
		return false;
	}
	if (certifyBtnChk == false) {
		alert("휴대폰 인증하기를 눌러주세요.");
		$("#phone_certify").focus();
		return false;
	}
	if (phoneCertifyChk == false) {
		alert("휴대폰 인증번호가 일치하지 않습니다.");
		$("#phone_certify").val("").focus();
		return false;
	}
	if ($.trim($("#bank").val()) == "직접입력" || $.trim($("#bank").val()) == "선택") {
		alert("은행을 입력하세요.");
		$("#bank").val("").focus();
		return false;
	}
	if ($.trim($("#account_name").val()) == "") {
		alert("예금주명을 입력하세요.");
		$("#account_name").val("").focus();
		return false;
		}
	if ($.trim($("#account").val()) == "") {
		alert("계좌번호를 입력하세요.");
		$("#account").val("").focus();
		return false;
		}
	if ($.trim($("#account").val()).length > 30) {
		alert("계좌번호를 30자리 이하로 작성하세요.");
		$("#account").val("").focus();
		return false;
		}
	
	return true;
};

 



$(document).ready(function() {
	

	  $('#domain').change(function() {
			
			var email = $("#email").val(); 
			var selectedOption = $(this).val();
			
			// @가 포함되어 있으면 @까지 자른다음 추가!
			if(email.includes('@')){
				var atIndex = email.indexOf('@');
				var emailWithoutDomain = email.substring(0, atIndex);
				$('#email').val(emailWithoutDomain + selectedOption);
			}else{
				//이메일 input태그에 selected 된것을 append
				$('#email').val($('#email').val() + selectedOption);	    	
			}
			
		});
	  	 
	  	  	  	  
	  // 지도 팝업창 띄우기
		var popupX = ((window.screen.width-600)/2);
         var popupY = ((window.screen.height-400)/2);
          $("#find_address").on('click', function(event){
          	event.preventDefault();
              window.open("/member/find_map", "지도보기", "resizeable=no, location=0, status=0, width=730px, height=800px, left="+popupX+", top="+popupY);
          });                  
    	
    	// 예금주명 클릭했을때 이름값을 가지고 똑같은 값을 넣는다.
    	$("#account_name").on("click",function(){
   		var name = $("#name").val();
   		
   		$("#account_name").val(name);
   		applyStyleToInput();
    	});
    	
   // 페이지 로드 후 실행되는 함수
    	window.onload = function() {
    	  // 사용자가 직접 입력한 값을 가져와서 스타일을 적용하는 함수 호출
    	  applyStyleToInput();
    	};
    	
    	$("input").on("change",function(){
    		applyStyleToInput();      		
    	});
    	
    	$(".mtbank").on("change", function(){
    		applyStyleToInput();
    	});
    		  	

    	// 사용자가 직접 입력한 값에 스타일을 적용하는 함수
    	function applyStyleToInput() {
    		$("input").each(function() {
    	      var value = $(this).val();
    	      if (value !== "") {
    	        $(this).addClass("filled");  // filled class를 덧붙인다.
    	      } else {
    	        $(this).removeClass("filled"); // filled class를 없앰
    	      }
    	    });
    		
    		var value = $(".mtbank").val();
    		
 				if(value == '직접입력' || value == '선택'){
 					$(".mtbank").removeClass("filled");
 				}else if(value !== ""){
 					$(".mtbank").addClass("filled");
 				}else{
 					$(".mtbank").removeClass("filled");
 				}
    	  }
     	
});


// 휴대폰 본인 인증
$(function() {
   var code = "";
   $("#phoneChk").click(function() {
      phoneBtnChk = true;
      var phone = $("#phone").val();

      if ($("#phone").val()=="") {
         alert("휴대폰 번호를 입력하세요.")
         $("#phone").focus();
         return false;
      }

         alert("인증번호 발송이 완료되었습니다. \n 휴대폰에서 인증번호를 확인해주세요.")

         $.ajax({
            type : "GET",
            url : "/member/phoneChk",
//            beforeSend : function(xhr){
//            	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
//            },
            data : {
               "phone" : phone
            },
            cache : false,
            success : function(data) {
               if (data == "error") {
                  alert("휴대폰 번호가 올바르지 않습니다.");
                  $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
                  $(".successPhoneChk").css("color", "red");
                  $("#phone").attr("autofocus", "true");
               } else {
                  $("#phone_certify").attr("disabled", false);
                  $("#phoneChk2").css("display", "inline-block");
                  $(".successPhoneChk").text("인증번호를 입력한 뒤 인증하기를 눌러주세요.");
                  $(".successPhoneChk").css("color", "green");
                  $("#phone").attr("readonly", "true");
                  code = data;
               }
            }
         });
   });
   
   // 휴대폰 인증번호 일치 여부
   $("#phoneChk2").click(function() {
      certifyBtnChk = true;
      phoneCertifyChk = true;
      var phone_certify = $("#phone_certify").val();

      if (!phone_certify) {
         alert("인증번호를 입력하세요.")
         $("#phone_certify").focus();
         return false;
      }

      if ($("#phone_certify").val() == code) {
         $(".successPhoneChk").text("인증번호가 일치합니다.");
         $(".successPhoneChk").css("color", "green");
         $("#phoneDoubleChk").val("true");
         $("#phone_certify").attr("disabled", true);

         phoneCertifyChk = true;

      } else {
         $(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
         $(".successPhoneChk").css("color", "red");
         $("#phoneDoubleChk").val("false");
         $(this).attr("autofocus", true);

         phoneCertifyChk = false;
      }
   });
});

//아이디 중복 검사	
function idCheck(){		
  idchkbtn = true;
  var id = $("#id").val();
  
  // 8자리 이상
  if ($.trim($("#id").val()).length < 8) {
		var newtext = '<font color="red">아이디는 8자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);
		$("#id").val("").focus();
		return false;
	};
 
 if ($.trim($("#id").val()).length > 16) {
		var newtext = '<font color="red">아이디는 16자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);
		$("#id").val("").focus();
		return false;
	};

if((!validate_userid(id))){
	var newtext = '<font color="red">아이디는 영문대소문자,숫자 조합만 가능합니다(숫자만도 가능).</font>';
	$("#idcheck").text('');
	$("#idcheck").show();
	$("#idcheck").append(newtext);
	$("#id").val("").focus();
	return false;
};

	     		
	
	$.ajax({ 
		type : "GET",
		url : 'normalidcheck',
		data : {
			'id' : id
		},
		
		success : function(data){
			
			if(data != 0){
				var newtext = '<font color="red">중복된 아이디가 있습니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").append(newtext);
				$("#idcheck").show();
				$("#id").val('').focus;
				return false;
			}else {
				var newtext = '<font color="green">사용 가능한 아이디 입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").append(newtext);
				$("#idcheck").show();
				$("#id").val().focus;
			}
		},
		
		error : function(e){
			alert("error" + e);
		}
	});
};

//비밀번호 확인
function passwordCheck(){
	
	passchkbtn = true;
	
	var password = $.trim($("#password").val());
	var password2 = $.trim($("#password2").val());
		
	if ($.trim($("#password").val()).length < 6) {
		var newtext = '<font color="red">비밀번호는 6자 이상이어야 합니다.</font>';
		$(".passChecking").text('');
		$(".passChecking").show();
		$(".passChecking").append(newtext);
		$("#password").val("").focus;
		$("#password2").val("");
		return false;
	};
 
 if ($.trim($("#password").val()).length > 16) {
		var newtext = '<font color="red">비밀번호는 16자 이하이어야 합니다.</font>';
		$(".passChecking").text('');
		$(".passChecking").show();
		$(".passChecking").append(newtext);
		$("#password").val("").focus;
		$("#password2").val("");
		return false;
	};
	
	if((!validate_userpass(password))){
		var newtext = '<font color="red">비밀번호는 영문대소문자,숫자,특수문자(+!@#$%^&)조합만 가능합니다(최소한 하나이상의 숫자포함).</font>';
		$(".passChecking").text('');
		$(".passChecking").append(newtext);
		$(".passChecking").show();
		$("#password").val("").focus();
		$("#password2").val("");
		return false;
	};
	
	
	if(password == password2){
		var newtext = '<font color=green> 사용가능한 비밀번호 입니다.</font>';
		$(".passChecking").text('');
		$(".passChecking").append(newtext);
		$(".passChecking").show();
	}else{
		var newtext = '<font color=red> 비밀번호가 같지 않습니다. 다시 확인해주세요.</font>';
		$(".passChecking").text('');
		$(".passChecking").append(newtext);
		$(".passChecking").show();
		$("#password2").val('');
	}
};

////////////////////////////////////////////////////////////////////////////////////////////////

function findpw(){
	if ($.trim($("#password").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#passwd").val("").focus();
		return false;
	}
	if ($.trim($("#password2").val()) == "") {
		alert("새 비밀번호 확인을 입력해주세요.");
		$("#passwd2").val("").focus();
		return false;
	}
	if (passchkbtn == false) {
		alert("비밀번호 확인 버튼을 눌러주세요.");
		$("#password").focus();
		return false;
	}
	return true;
}

function findpwcheck(){
	if ($.trim($("#id").val()) == "") {
		alert("ID를 입력하세요.");
		$("#id").val("").focus();
		return false;
	}
	if ($.trim($("#phone").val()) == "") {
		alert("휴대폰 번호를 입력하세요.");
		$("#phone").val("").focus();
		return false;
	}
	if (isNaN($("#phone").val())) {
		alert("숫자만 입력하세요");
		$("#phone").val("").focus();
		return false;
	}
	if (phoneBtnChk == false) {
		alert("휴대폰 인증번호 전송을 눌러주세요.");
		$("#phone_certify").focus();
		return false;
	}
	if ($.trim($("#phone_certify").val()) == "") {
		alert("휴대폰 인증번호를 입력하세요.");
		$("#phone_certify").focus();
		return false;
	}
	if (certifyBtnChk == false) {
		alert("휴대폰 인증하기를 눌러주세요.");
		$("#phone_certify").focus();
		return false;
	}
	if (phoneCertifyChk == false) {
		alert("휴대폰 인증번호가 일치하지 않습니다.");
		$("#phone_certify").val("").focus();
		return false;
	}
	return true;
};

function findidcheck(){
	if ($.trim($("#email").val()) == "") {
		alert("이메일을 입력하세요.");
		$("#email").val("").focus();
		return false;
	}
	if ($.trim($("#phone").val()) == "") {
		alert("휴대폰 번호를 입력하세요.");
		$("#phone").val("").focus();
		return false;
	}
	if (isNaN($("#phone").val())) {
		alert("숫자만 입력하세요");
		$("#phone").val("").focus();
		return false;
	}	
	return true;
};
