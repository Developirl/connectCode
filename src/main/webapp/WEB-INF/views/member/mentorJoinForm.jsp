<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${javascriptkey}"></script>

<script src="/member/js/mentorJoin.js"></script>
<link rel="stylesheet" type="text/css" href="/member/css/mentor.css" />

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<div class="arrow">
	<a href="/member/loginform"><span class="bi-arrow-left"></span></a>
</div>

<div class="col-lg-4 container">
<div class="mentee_info">

<form method="post" action="/member/join_normalmentor" onsubmit="return check()">
<div class="menteecontainer">
  <h1 class="firstsub"><span>CONNECT</span><span class="firstsub2"> CODE</span></h1>
  <div class="hr"></div>
  <h3><span class="secondsub">멘토 회원가입</span></h3>
</div>


<div class="join_mentee">
<label for="id">ID</label>&nbsp;<span class="require">(※필수)</span>
<div class="form-group">
<input type="text" id="id" name="id" class="form-control "><br>
<button class="button" type="button" id="sameid" onclick="idCheck()">ID중복검사</button>
</div>
<span id="idcheck" class="block-span"></span>
</div>

<div class="join_mentee">
<label for="password">비밀번호</label>&nbsp;<span class="require">(※필수)</span>
<input type="password" id="password" name="password" class="form-control">
<span></span>
</div>

<div class="join_mentee">
<label for="password2">비밀번호 확인</label>&nbsp;<span class="require">(※필수)</span>
<div class="form-group">
<input type="password" id="password2" name="password2" class="form-control ">
<button class="button" type="button" id="passCheck" onclick="passwordCheck()">확인</button>
</div>
<span class="passChecking"></span>
</div>

<div class="join_mentee">
<label for="name">이름</label>&nbsp;<span class="require">(※필수)</span>
<input type="text" id="name" name="name" class="form-control ">
</div>

<div class="join_mentee">
<label for="gender">성별</label>&nbsp;<span class="require">(※필수)</span>
<div class="genselect">
<input type="radio" id="male" name="gender" value="male">
<label for="male">남자</label>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" id="female" name="gender" value="female">
<label for="female">여자</label>
</div>
</div>


<div class="join_mentee">
<label for="changebirthday">생일</label>&nbsp;<span class="require">(※필수)</span>
<input type="date" id="changebirthday" name="changebirthday" class="form-control">
</div>

<div class="join_mentee">
<label for="email">이메일</label>&nbsp;<span class="require">(※필수)</span>
<div class="form-group">
<input type="email" id="email" name="email" class="form-control mtemail" onblur="emailchk()">
 
<select id="domain" name="mail_list" class="form-control" onblur="emailchk()">
<option value="">직접입력</option>
<option value="@naver.com">@naver.com</option>
<option value="@gmail.com">@gmail.com</option>
<option value="@daum.net">@daum.net</option>
<option value="@nate.com">@nate.com</option>
</select>
</div>
<span id="emailcheck"></span>
</div>

<div class="join_mentee">
<label for="mentoring_location">상담가능지역</label>&nbsp;<span class="require">(※필수)</span>
<div class="form-group">
<input type="text" id="mentoring_location" name="mentoring_location" class="form-control">
<button id="find_address" class="button">주소 검색</button>
</div></div>

<div class="join_mentee">
<label for="phone">휴대폰번호</label>&nbsp;<span class="require">(※필수)</span>
<div class="form-group">
<input type="text" id="phone" name="phone" class="form-control">
<input type="button" id="phoneChk" class="button" value="인증번호 전송"/>
</div>
<div class="form-group ys_certify">
<input id="phone_certify" name="phone_certify" class="form-control" disabled="disabled"> 
<input type="button" id="phoneChk2" class="button" value="인증하기"> 
</div>
<span class="successPhoneChk">※ 휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
<input type="hidden" id="phoneDoubleChk" />
</div>


<!-- 은행 성훈이가 수정중!!! 나중에 수정!!! -->
<div class="join_mentee">
<label for="bank">은행</label>&nbsp;<span class="require">(※필수)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<label for="account_name">예금주명</label>&nbsp;<span class="require">(※필수)</span>

<div class="form-group">
<select id="bank" name="bank" class="form-control mtbank">
</select>

<input type="text" id="account_name" name="account_name" class="form-control">
</div>
<div class="form-group">
<input type="text" id="customBank" name="customBank" value="" class="form-control mtbank" style="display: none;">
<input type="button" id="bankselfwrite" class="button" value="은행 직접입력" style="display:none;" >
</div>
<span class="bankoptionChk"></span>
</div>

<div class="join_mentee">
<label for="account">계좌번호</label>&nbsp;<span class="require">(※필수)</span>
<input type="text" id="account" name="account" class="form-control">
</div>
<!-- 
<div class="join_mentee">
<label for="technology">보유기술</label>&nbsp;<span class="choice">(※선택)</span>
<input type="text" id="technology" name="technology" class="form-control">
</div>

<div class="join_mentee">
<label for="intro">소개글</label>&nbsp;<span class="choice">(※선택)</span>
<input type="text" id="intro" name="intro" class="form-control">
</div>

<div class="join_mentee">
<label for="unable_date">상담불가요일</label>&nbsp;<span class="choice">(※선택)</span>
<input type="text" id="unable_date" name="unable_date" class="form-control">
</div>
 -->
<br>
<div align="center">
<button type="submit" class="submitBtn">회원가입</button>
<button type="reset" class="resetBtn">닫기</button>
</div>
</form>
</div>
</div>
<br><br>
<script>
   
  var bank = ['','직접입력','신한은행','국민은행','기업은행','농협은행','산업은행','수협은행','신협은행','우리은행','하나은행','한국씨티은행','카카오뱅크','케이뱅크','토스뱅크','경남은행','광주은행','대구은행','부산은행','전북은행','제주은행','새마을은행','우체국','저축은행'];

	// [은행명] select option
	         for (var i = 0; i < bank.length; i++) {
	            if(bank[i] == ''){
	               var option = $('<option>').attr({
	                  value : '선택'
	               }).text('선택'); // 값 설정
	            }else {
	               var option = $('<option>').attr({
	                  value : bank[i]
	               }).text(bank[i]); // 값 설정
	            }
	            $('#bank').append(option);
	         }
  
  $("#bank").on("change", function(){
	  changebank(this);
	  $(".bankoptionChk").hide();
  });
  
  function changebank(element){
	  
	  var selectedOption = $(element).val();
	  var customBankInput = document.getElementById("customBank");
	  var bankselfwrite = document.getElementById("bankselfwrite");
	  
	  if (selectedOption == "직접입력") {
	    customBankInput.style.display = "block";
	    bankselfwrite.style.display = "block";
	    
	  } else {
	    customBankInput.style.display = "none";
	    bankselfwrite.style.display = "none";
	  }
  };
	  	
  
  $("#bankselfwrite").on("click", function() {
	  var customBankValue = $("#customBank").val();  // 사용자로부터 값을 입력 받음
	  var customBankInput = document.getElementById("customBank");
	  var bankselfwrite = document.getElementById("bankselfwrite");
	  	  
	   if(!(validate_userbank(customBankValue))){
		  
		 var newtext = '<font color="red">선택옵션에 있는 은행들만 입력해주세요.</font>';
		  	
		  	$(".bankoptionChk").text('');
		  	$(".bankoptionChk").append(newtext);
		  	$(".bankoptionChk").show();
		  	$("#customBank").val('');
		  	return false;
	  }else{
		  
		  var newtext = '<font color="green">사용가능한 은행명입니다.</font>';
		  
		  	$(".bankoptionChk").text('');
		  	$(".bankoptionChk").append(newtext);
		  	$(".bankoptionChk").show();
	  }
	  
	  if (customBankValue) {
	    var selectElement = $("#bank");  // select 요소 선택
	    var existingOption = selectElement.find('option[value="' + customBankValue + '"]');  // 입력값과 동일한 value를 가진 기존 option 찾기

	    if (existingOption.length === 0) {
	      // 새로운 option 생성 및 추가
	      var newOption = $('<option>', {
	        value: customBankValue,
	        text: customBankValue
	      });
	      selectElement.append(newOption);
	    }

	    selectElement.val(customBankValue);  // 입력값으로 select 요소의 값을 설정
	    console.log(selectElement.val());
	    
	    
	    customBankInput.style.display = "none";
	    bankselfwrite.style.display = "none";
	    
	    $("#customBank").val('');
	  }
	});
  
  
  
	         
</script>

</body>
</html>