<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID찾기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="/member/js/joinForm.js"></script>
<link rel="stylesheet" type="text/css" href="/member/css/mentee.css" />

<script>

$(document).ready(function() {
	  $('#modalTrigger').click(); // 모달 버튼 클릭 이벤트 자동으로 실행
	});

</script>

</head>
<body>

<c:if test="${empty findidok }">
<form action="/member/mentorfindid" method="post" onsubmit="return findidcheck()">
<div class="col-lg-3 container" id="ys_findidform">
<div align="center">
  <h2><span class="ys_findidfont">ID 찾기</span></h2>
</div>
<div class="join_mentee_sub">
<label for="phone" style="font-weight: bold;">휴대폰번호</label>
<div class="form-group">
<input type="text" id="phone" name="phone" class="form-control" style="width:300px;margin-right: 10px;">
<input type="button" id="phoneChk" class="button" value="인증번호 전송"/>
</div>
<div class="form-group ys_certify">
<input id="phone_certify" name="phone_certify" class="form-control" disabled="disabled" style="width:300px;margin-right: 10px;"> 
<input type="button" id="phoneChk2" class="button" value="인증하기"> 
</div>
<span class="successPhoneChk">※ 휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
<input type="hidden" id="phoneDoubleChk" />
</div>
<div align="center">
<button type="submit" class="submitBtn">ID찾기</button>
<button type="button" class="resetBtn" onclick="window.close()">닫기</button>
</div>
</div>
</form>
</c:if>

<!-- 일반회원일때 -->
<c:if test="${findidok == 'normalmentor'}">
<!-- Button trigger modal -->
 <button type="button" id="modalTrigger" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="display: none;">
  Launch static backdrop modal
</button> 

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">ID찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
           회원님의 아이디는 ${id} 입니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="window.close()">Close</button>
      </div>
    </div>
  </div>
  </div>
</c:if>


<!-- 회원가입이 되지 않은 회원 -->
<c:if test="${findidok == 'no'}">
<!-- Button trigger modal -->
 <button type="button" id="modalTrigger" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="display: none;">
  Launch static backdrop modal
</button> 

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">ID찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            회원가입이 되지 않은 회원입니다. 회원가입을 해주세요.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="window.close()">Close</button>
      </div>
    </div>
  </div>
  </div>
</c:if>





</body>
</html>