<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>

@import
   url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap')
;

* {
   font-family: 'Noto Sans KR', sans-serif !important;
}

.ys_con{

  margin-top: 70px;
  margin-left: 400px;
  margin-right: 300px;
  display: flex;
  justify-content: center;
}

.ys_freedetailheader{
font-size: 40px;
margin-left: 130px;
}

.ys_formgrp{
margin-top: 30px;
}

.ys_mentorrep{
margin-top: 50px;
}

.container-fluid.ys_repcon{
	margin-top: 40px;
 	margin-left: 575px;   
  justify-content: center;
  width: 750px;

}

.ys_mentorname{
margin-right:  30px;
}

.form-control .ys_freerepform{
width: 920px;
}

form.form-contorl.ys_freerepform {
    border-top: 1px solid black;
}

.ys_freecon{
resize: none;
}

.ys_freebuttons{
margin-top: 20px;
}

.ys_freeupdatebut{
margin-left: 30px;
text-decoration: none;
}
.ys_freedeletebut{
text-decoration: none;
}


</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>

 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 
 <script>
 
$(document).ready(function(){
	
	$(".ys_freerepform2").hide(); 
	
	// 댓글 입력 버튼
	 $(".ys_repbutt").on("click",function(){
		$(".ys_freerepform2").show(); 
	 });
	
	
	 // 취소 눌렀을때 text없애고 hide
	$(".ys_repfail").on("click", function(){
		$(".ys_freecon").val("");
		$(".ys_freerepform2").hide();
	
	});
	 
	 var result = '${result}';
	 
	 if(result == "updatefree"){
		 alert("글이 수정되었습니다.");
	 }
	 
	 
	$(".ys_repsuccess").on("click", function(){
		
		var mentor_no = $("#insertfreementor").val();
		var free_no = $("#insertfree_no").val();
		var name = "${mentor.name}";
		var content = $("#content").val();
		
		$.ajax({
			type : 'get',
			url : '/freeMentoring/insertreply',
			data : {'mentor_no' : mentor_no,
					'free_no' : free_no,
					'name' : name,
					'free_reply_content' : content
			},
			success : function(data){
				
				if(data == 1){					
				console.log(data);
				location.reload(true);
				}
			},
			error : function(e){
				alert("error: "+ e);
			}
		
		
			});
			
		});
	
	 
});

// 원래는 location.reload말고 data에 json형식으로 list를 다시 받아와 append로 뿌려줘야 한다.
function replydelete(button) {
    var replyNo = button.getAttribute("data-reply-no");
    var free_no = '${freeboard.free_no}';

    $.ajax({
    	type : 'get',
    	url : '/freeMentoring/deletereply',
    	data : {
    		'free_no' : free_no,
    		'free_reply_no' : replyNo
    	},
    	success : function(data){
    		if(data == 1){
    			console.log(data);
    			location.reload(true);
    		}
    	},
    	error : function(e){
    		alert("error:" + e);
    	}
    	
    });
		
}

function replyupdateok(button) {
	  var replyNo = button.getAttribute("data-reply-no");
	  console.log(replyNo); // 추출된 값 출력

	  // 데이터 추출 및 편집 양식에 설정
	  var replyContent = document.getElementById("free_reply_content" + replyNo).value;

	  $.ajax({
		  type : 'get',
		  url : "/freeMentoring/updatereply",
		  data : {
			  'free_reply_no' : replyNo,
			  'free_reply_content' : replyContent
		  },
		  success : function(data){
			  
			  if(data == 1){
				  console.log(data);
				  location.reload(true);
			  }
		  },
		  error : function(e){
			  alert("error:" + e);
		  }
		  
	  });
	}
 
 
function replyupdate(button) {
	  var replyNo = button.getAttribute("data-reply-no");
	  console.log(replyNo); // 추출된 값 출력

	  // 수정 버튼 텍스트 변경
	  button.value = "확인";
	  button.classList.remove("btn-primary");
	  button.classList.remove("ys_repupdate" + replyNo);
	  button.classList.add("btn-success");
	  button.classList.add("ys_repconfirm" + replyNo); // 클래스 이름 변경

	  // 삭제 버튼 숨기기
	  var deleteButton = document.getElementById("ys_repdelete" + replyNo)
	  deleteButton.style.display = "none";

	  // 취소 버튼 생성
	  var cancelButton = document.createElement("input");
	  cancelButton.type = "button";
	  cancelButton.value = "취소";
	  cancelButton.classList.add("btn");
	  cancelButton.classList.add("btn-secondary");
	  cancelButton.classList.add("ys_repcancel" + replyNo);
	  cancelButton.setAttribute("data-reply-no", replyNo);
	  cancelButton.addEventListener("click", function() {
	    replycancel(this);
	  });

	  // 수정 버튼과 삭제 버튼 사이에 취소 버튼 추가
	  button.parentNode.insertBefore(cancelButton, deleteButton);
	  
	// 버튼의 ID 변경
	  $(button).attr("id", "ys_repconfirm" + replyNo);
	
	  // textarea 편집 가능하게 설정
	  var textarea = document.getElementById("free_reply_content" + replyNo);
	  textarea.removeAttribute("readonly");
	
	  var confirmButton = document.getElementById("ys_repconfirm" + replyNo)
	  confirmButton.addEventListener("click", function() {
		    replyupdateok(this);
		  });
	}

	function replycancel(button) {
	  var replyNo = button.getAttribute("data-reply-no");
	  console.log(replyNo); // 추출된 값 출력

	  // 확인 버튼으로 변경된 수정 버튼 복원
	  var confirmButton = document.getElementById("ys_repconfirm" + replyNo)
	  confirmButton.value = "수정";
	  confirmButton.classList.remove("btn-success");
	  confirmButton.classList.add("btn-primary");
	  confirmButton.classList.remove("ys_repconfirm"+replyNo); // 클래스 이름 변경
	  confirmButton.classList.add("ys_repupdate" + replyNo);
	  confirmButton.id = "ys_repupdate" + replyNo;

	  // 삭제 버튼 다시 보이게 설정
	  var deleteButton = document.getElementById("ys_repdelete" + replyNo);
	  deleteButton.style.display = "";

	  // 취소 버튼 제거
	  button.parentNode.removeChild(button);
	  
	  var textarea = document.getElementById("free_reply_content" + replyNo);
	  textarea.setAttribute("readonly", "readonly");
	  

	}



 
	 
 
 
 </script>
 
 
<%@include file="../public/header.jsp" %>
</head>
<body>
   <div class="container ys_con">
      <form>
      	<span class="ys_freedetailheader">Free Mentoring 상세페이지</span>
        <div class="form-group ys_formgrp">
           
           <input type="hidden" name="mentee_no" value="${freeboard.mentee_no}">
           
           <label for="name">멘티</label><br>
           <input type="text" name="name" value="${freeboard.name}" readonly="readonly"><br><br>
           
              <label for="free_title">제목</label>
            <input type="text" id="free_title" name="free_title" class="form-control" value= "${freeboard.free_title }" readonly>
          </div><br>
     
          <div class="form-group">
            <label for="free_content">내용</label>
            <textarea id="free_content" name="free_content" class="form-control"
             rows="20" cols="80" readonly>${freeboard.free_content }</textarea>
          </div>
        
        <div class="ys_freebuttons" align="center">
        
        
        <!-- 데이터의 mentee_no와 session mentee_no 같을때 나오게 -->
        <c:if test="${freeboard.mentee_no eq mentee_no }">
		<a href="/freeMentoring/freeMentoringUpdateForm.do?free_no=${freeboard.free_no}&page=${page}" class="ys_freeupdatebut">
			<button type="button" class="btn btn-primary">수정하기</button>
		</a>
				
		<button type="button" id="modalTrigger" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">삭제하기</button> 
		</c:if>
		
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
       					 <h1 class="modal-title fs-5" id="staticBackdropLabel">글 삭제</h1>
        				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      			<div class="modal-body">
            		정말로 삭제하시겠습니까?
      			</div>
      		<div class="modal-footer">
      			<a href="/freeMentoring/freeMentoringdelete.do?free_no=${freeboard.free_no}">
        		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">삭제</button>
        		</a>
        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
     		</div>
    		</div>
  		</div>
  		</div>
		
		<!-- 멘토만 보이게 -->
		<c:if test="${not empty mentor}">
        <input type="button" class="btn btn-primary ys_repbutt" value="답글 입력">
        </c:if>
        
        <c:if test="${empty keyword}">
        <a href="/freeMentoring/freeMentoringList.do?page=${page}" class="btn btn-secondary">목록으로</a>
        </c:if>
        
        <c:if test="${not empty keyword}">
        <a href="/freeMentoring/freeMentoringList.do?page=${page}&search=${search}&keyword=${keyword}" class="btn btn-secondary">목록으로</a>
        </c:if>
        <br>
        </div>
        <div class="form-group ys_mentorrep">
        	<h2>mentor 답글</h2>
        </div>
      </form>
   </div>
   
      <div class="container-fluid ys_repcon">
      	
      		<form class="form-contorl ys_freerepform2">
				<h3>Mentor 답글입력</h3>
      			<div class="form-group">
      			
      			<input type="hidden" id="insertfreementor" name="mentor_no" value="${mentor.mentor_no}">
      			
      			<input type="hidden" id="insertfree_no" name="free_no" value="${freeboard.free_no}">
      			
      			<label for="content">내용</label><br>
      			<textarea rows="6" cols="40" class="form-control ys_freecon" id="content" name="free_reply_content"></textarea>
      			</div> 
      			<br>
      			<div align="center">
      			<!-- 눌렀을때 ajax요청 보냄 -->
      			<input type="button" class="btn btn-secondary ys_repsuccess" value="입력">
      			<input type="button" class="btn btn-secondary ys_repfail" value="취소">
      			</div>
      			<br>
      		
      		</form>
      		
      		<c:if test="${empty freereplylist }">
      		<form class="form-contorl ys_freerepform">
      		<br>
      		<h3>답글이 없습니다.</h3>
      		<br>
      		</form>      		
      		</c:if>
      		
      		<c:set var="replynum" value="${total}"></c:set> 		
      		<c:if test="${not empty freereplylist}">
      		<c:forEach var="replylist" items="${freereplylist}" end="${total}" step="1">
      		<form class="form-contorl ys_freerepform">
      			<div class="form-group">
      			<label for="">답글 No.</label><c:out value="${replynum}"></c:out>
      			</div>
      			<br>
      			<div class="form-group">
      			<label for="name">멘토</label>
      			<input type="text" class="ys_mentorname" id="name" name="name" value="${replylist.name }" readonly="readonly">
      			<label for="free_reply_regdate">작성일</label>
      			<input type="text" id="free_reply_regdate" name="free_reply_regdate" value='<fmt:formatDate value="${replylist.free_reply_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>' readonly="readonly">
      			</div>
      			<br>
      			<div class="form-group">
      			
      			<label for="free_reply_content${replylist.free_reply_no}">내용</label><br>
      			<textarea rows="6" cols="40" class="form-control ys_freecon" readonly="readonly" id="free_reply_content${replylist.free_reply_no}" 
      			name="free_reply_content">${replylist.free_reply_content}</textarea>
      			</div> 
      			<br>
      			<div align="center">
      			<c:if test="${replylist.mentor_no eq mentor.mentor_no }">
      			<!-- session의 member_no나 mentor_no값이 데이터의 member_no와 mentor_no 값이 같을때 보이게 -->	
      			<input type="button" class="btn btn-primary ys_repupdate${replylist.free_reply_no}" 
      			id="ys_repupdate${replylist.free_reply_no}" data-reply-no="${replylist.free_reply_no}" onclick="replyupdate(this)" value="수정">
      			<input type="button" class="btn btn-secondary ys_repdelete${replylist.free_reply_no}" 
      			id="ys_repdelete${replylist.free_reply_no}" data-reply-no="${replylist.free_reply_no}" onclick="replydelete(this)" value="삭제">
      			</c:if>
      			</div>
      			<br>
      			
      			<c:set var="replynum" value="${replynum -1}"></c:set>
      		</form>
			</c:forEach>
			
			</c:if>	      		
      
      	
	</div>
<%@include file="../public/footer.jsp" %>
</body>
</html>