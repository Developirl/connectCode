<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<%-- 부트스트랩 아이콘 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<%-- 제이쿼리 CDN --%>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>

/* 내가 사용하는 개인 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Domine:wght@600&display=swap');

.js-mentoringhistory-box *,.js-review-content-box *{
	font-family: 'Noto Sans KR', sans-serif!important;
	color:#5D5D5D;
}

.js-mentoringhistory-box{
	border:1px solid white;
	margin:80px 30px;
	padding:0 100px;
	
}

.js-mentoring-box{
	font-size: 12pt;
	font-weight: bold;
	display: flex;
	align-items: center;
}

.js-menhistory-title{
	border:1px solid #B8B8B8;
	padding:40px 0;
	text-align: center;
	font-weight: bold;
	border-top:none;
	border-left:none;
	border-right: none;
	font-size: 16pt!important;
}

.js-menhistory-L{
	font-size:12pt;
	font-weight: 600;
}
.js-menhistory-m{
	font-size:11pt;
	font-weight: 400;
	color:#A6A6A6;
}

.bi-check-circle,.bi-check-circle-fill,.bi-slash-circle{
	 color:#004EA2;
	 font-size:35px;
	 
}

.js-history-card-table{
	width:100%;
}
.js-history-card-table tr{
	width:100%;
}
.js-history-card-table td,.js-history-card-table th{
	padding: 10px 40px;	
	padding-bottom:0px;
}

.js-history-card{
	border:1px solid #F2F5F5;
	border-radius:10px;
	background:white;
	padding:40px 20px;
	width:100%;
	margin-top:40px;
	margin-bottom:20px;
	text-align: center;
	box-shadow: 3px 3px 10px 2px #F2F5F5;

}

.js-history-card:hover{
	box-shadow: 3px 3px 14px 2px #D9D9D9;
}

.menClassification{
	margin-left:15px;
	font-size: 14pt;
}

.gogoReivew{
	color:#004EA2;
	text-decoration: overline;
	cursor: pointer;
}
.gogoReivew:hover{
	font-weight: bold;
}

.cancelPayment{
	color:#B31259;
	text-decoration: overline;
	cursor: pointer;
}

.cancelPayment:hover{
	font-weight: bold;
}

/* ---------------- 후기 남기는 모달 -------------------- */

.js-review-modal {
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

.js-review-modal.show {
	display: block;
}

.js-review-modal-body {
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

.js-review-content-box{
	border:1px solid white;
	text-align: center;
	padding:20px 30px;
}

.js-reviewRatingbox{
	margin: 30px 0;
}

.reviewMentorName{
	font-size:14pt;
	font-weight: bold;
}


.bi-star,.bi-star-fill{
	font-size:24px;
	color:#F2CB61;
	cursor:pointer;
}

.js-review-submit-butt{
	border:2px solid #004EA2;
	font-family: 'Noto Sans KR', sans-serif!important;
	padding:5px 10px;
	color:#004EA2;
	background: white;
	border-radius: 8px;
}
.js-review-submit-butt:hover{
	border:2px solid #004EA2;
	color:white;
	background: #004EA2;
}
</style>





</head>


    
<%@ include file="../public/header.jsp" %>

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
            <div class="row">
                
                <div class="col-2">
                	<%@ include file="sidebar.jsp" %>
                </div>
                
                
                <div class="col-8">
                <%-- 여기서 부터 작업 영역 입니다.  --%>


                	<div class="js-mentoringhistory-box">
            	    	<div class="js-menhistory-title">내 멘토링 내역</div>
                		
                		<div class="js-mentoring-box-container">
                		
                			<c:forEach var="i" items="${list}">
                			<div class="js-history-card">
                			
                				<table class="js-history-card-table">
                					<tr>
	                					<td colspan="2">
			                				<div class="js-mentoring-box">
			                				   <c:if test="${i.menClassification == 35}">
			                				   		<i class="bi bi-check-circle-fill"></i> <span class="menClassification">상담 완료</span>
			                				   </c:if> 
			                				   <c:if test="${i.menClassification == 32}">
			                				   		<i class="bi bi-check-circle"></i> <span class="menClassification">상담 예정</span>
			                				   </c:if> 
			                				   <c:if test="${i.menClassification == 31}">
			                				   		<i class="bi bi-slash-circle"></i> <span class="menClassification">예약 대기중</span>
			                				   </c:if> 
			                				</div>
	                					</td>
                					</tr>
                					
                					<tr>
                						<td colspan="2">
                							<span class="js-menhistory-L">${i.name } 멘토와 멘토링</span>
                						</td>
                					</tr>
                					<tr>
                						<td colspan="2">
                							<span class="js-menhistory-m">${i.mentoring_kind}</span>
                						</td>
                					</tr>
                					<tr>
                						<td colspan="2">
                							<span class="js-menhistory-m">
                							<fmt:formatDate value="${i.reserve_date}" pattern="yyyy-MM-dd HH:mm E요일"></fmt:formatDate>
                							</span>
                						</td>
                					</tr>
                					<tr>
                						<td width=50%>
                							<span class="js-menhistory-m">
                								<fmt:formatNumber value="${i.pay_amount }" type="number" var="pay" /><b class="js-menhistory-m">${pay}</b> 원
                							</span>
                						</td>
                						<td width=50% align="right">
	                						<c:if test="${i.review_no != 0 }">
	                								<span class="js-menhistory-m">리뷰 작성 완료</span>
	                						</c:if>
	                						<c:if test="${i.review_no == 0 && i.menClassification != 35  }">
	                								<div class="cancelPayment" data-value="${i.mentoring_no}"
	                									data-orderNo="${i.order_no}" data-impNo="${i.iamport_order_no}" data-payNO="${i.payment_no}"
	                									 onclick="openPayCancelModal(${i.payment_no});">멘토링 취소하기</div>
	                						</c:if>
	                						<c:if test="${i.review_no == 0 && i.menClassification == 35  }">
	                								<div class="gogoReivew" data-value="${i.mentoring_no}"
	                									 onclick="buildReviewModal(${i.mentoring_no},'${i.name }');">리뷰 작성하기</div>
	                						</c:if>
                						</td>
                					</tr>
                				</table>
                				
                			</div>	
                			</c:forEach>
                			
                			
                		</div>
                		
			</div>
				
				
				
				
							<div class="js-review-modal">
								<div class="js-review-modal-body" align=center>
				
									<div class="jh-modal-cancelbutt" onclick="closeReviewModal();">
										<i class="bi bi-x-circle"></i>
									</div>
		
									<div class="js-review-content-box">
										
										<span class="reviewMentorName"></span><span> 멘토와의 멘토링 후기 남기기</span>
										
										<div class="js-reviewRatingbox">
											<i class="bi js-mystar bi-star" data-value="1" id="start-1"></i>
											<i class="bi js-mystar bi-star" data-value="2" id="start-2"></i>
											<i class="bi js-mystar bi-star" data-value="3" id="start-3"></i>
											<i class="bi js-mystar bi-star" data-value="4" id="start-4"></i>
											<i class="bi js-mystar bi-star" data-value="5" id="start-5"></i>
										</div>
										
										<textarea class="form-control" rows="5" maxlength="300" placeholder="리뷰를 작성해보세요 ! 최대 300자 입력가능"
										  style="resize:none;" id="mentoring-review-con"></textarea>
									
									</div>
									<input type=hidden id="lastRating">
									<input type=hidden id="mentoring_no_no">
									<input type=button value="후기 작성" class="js-review-submit-butt">
				
								</div>
							</div>
				
				
				
				
				
							<%-- 작업 영역 끝 --%>
                </div>
                <!-- <div class="col-8"> END -->
                
                
                <!-- 여백 -->
                <div class="col-2"></div>
            </div>
        </div>
        
        <br><br><br><br><br><br><br>
        <script>
        
    	// 시큐리티용 변수 
    	var csrf = "${_csrf.headerName}";
    	var csrfToken = "${_csrf.token}";
        
        
		$(document).ready(function(){
			
			
			var rating = 0;
			
			$(".bi-star").click(function(){
				rating = $(this).data('value');
				
				//hidden에 해당 결과 값을 셋팅해준다. 
				$("#lastRating").val(rating);
				
				var stars = document.getElementsByClassName('js-mystar');
				
				 for (var i = 0; i < stars.length; i++) {
				        if (i <= rating-1) {
				          stars[i].classList.remove('bi-star'); // 컬러가 없는 별로 변경
				          stars[i].classList.add('bi-star-fill'); // 컬러가 채워진 별로 변경
				        } else {
				          stars[i].classList.remove('bi-star-fill'); // 컬러가 없는 별로 변경
				          stars[i].classList.add('bi-star'); // 컬러가 채워진 별로 변경
				        }
				      }
				
			});
			
			
			
			var dbclickCheck = true;
			
			// 후기 작성 클릭시 이벤트 발생
			$(".js-review-submit-butt").click(function(){
				
				if(dbclickCheck){
					
					dbclickCheck = false;
					
					if($('#lastRating').val() < 1){
						alert("별점을 선택해주세요.");
						dbclickCheck = true;
						return false;
					}
					
					if($(".form-control").val()==''){
						alert("후기 내용을 간단하게 작성해주세요. ");
						$(".form-control").focus();
						dbclickCheck = true;
						return false;
					}
					
					
					var mentoring_no = $("#mentoring_no_no").val();
					var rating = $("#lastRating").val();
					var content = $(".form-control").val();
					alert("리뷰 작성시 전달하는 값들 \nrating = "+rating+"\ncontent="+content+"\nmentoring_no="+mentoring_no);
					// review를 insert 하는 요청을 보낸다. 
					$.ajax({
						  url: '/mentee/insertReviewAndAlarm',
						  method: 'POST', // HTTP 요청 메서드 (GET, POST, 등)
						  data: { 
							  mentoring_no : mentoring_no,
							  rating : rating,
							  content : content
							  }, // 요청 데이터 (선택적)
						  beforeSend: function(xhr){
			            	xhr.setRequestHeader(csrf,csrfToken);
			              },
						  success: function(rsp) {
							  if(rsp >= 1){
								  alert("후기 작성 완료");
								  closeReviewModal();
								  location.reload();
							  }
							
							  dbclickCheck = true;
						  },
						  error: function(xhr, status, error) {
						    console.log(error); 
						    dbclickCheck = true;
							closeReviewModal();
						  }
					});
					
					
					
				}else{ // dbclickCheck 가 false면
					dbclickCheck = true;
					return false;
				}
				
				
			
			});
			
			
			
		});        
        
        
        function buildReviewModal(mentoring_no,name){
        	$(".reviewMentorName").text(name);
        	$("#mentoring_no_no").val(mentoring_no);
        	openReviewModal();
        }
        
        
        
		//모달 오픈하는 함수로, 오픈시킬 버튼에 onclick에서 함수 호출해주심 됩니다.
		function openReviewModal() {
		    const modal = document.querySelector('.js-review-modal');
		    modal.style.display = 'block';
		    $(".form-control").focus();
		}
		// 모달 닫는 함수, onclick 에서 함수 호출
		function closeReviewModal(){
		    const modal = document.querySelector('.js-review-modal');
		    modal.style.display = 'none';
		}
		
		function openPayCancelModal(payment_no){
			
			console.log("payment_no ="+payment_no);
			
			// 시큐리티용 변수 
			var csrf = "${_csrf.headerName}";
			var csrfToken = "${_csrf.token}";
			
			if(confirm('정말 예약 취소하시겠습니까? ')){
				
	
	            $.ajax({
	                url: "/payment/refund", 
	                type: "GET",
	                dataType: 'JSON',
	                beforeSend: function(xhr){
	                	xhr.setRequestHeader(csrf,csrfToken);
	                },
	                data : { payment_no : payment_no },
	            }).done(function(res) {
	            	
	            	
	                if (res > 0) {
	                    alert('결제가 취소되었습니다. ');
	                    location.reload();
	                }
	                else {
	                	console.log('결제 취소 실패');
	                }
	            }) // end ajax
	            
	
				
			}// end if
			
			
		}


</script>
        
<%@ include file="../public/footer.jsp" %>        























        