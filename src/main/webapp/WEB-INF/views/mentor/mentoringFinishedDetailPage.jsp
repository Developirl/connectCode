<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<script src="http://code.jquery.com/jquery-latest.js"></script>

<div class="w3-container">
	<div class="fixedTop_div"></div>
		
	<div style="display: flex;">
		<div class="medium_jh" style="width: 50%; text-align: left;">${finished_detail.name}</div>
		<div class="small_jh" style="width: 60%; text-align: right; color: #777777">[전화번호]&nbsp;${finished_detail.phone}</div>
		<div class="small_jh" style="width: 40%;text-align: right; color: #777777">[성별]&nbsp;${finished_detail.gender}</div>
	</div>
	<div>
	<div class="small_jh">[멘토링예약]&nbsp;${finished_detail.mentoring_kind}</div>
	<div class="small_jh">[직무]${finished_detail.desired_job}</div>
	<div class="small_jh">[멘토링지역]${finished_detail.mentoring_location}</div>
	<div class="small_jh">[질문]${finished_detail.request_content}</div>
	<div class="small_jh" style="width: 60%; text-align: right;">[깃 주소]&nbsp;${finished_detail.git}</div>
	<div class="small_jh" style="width: 40%; text-align: right;">[블로그 주소]&nbsp;${finished_detail.blog}</div>
	</div>
	<div style="display:flex;">
		<div class="small_jh">감자뿡</div>
	</div>
	
	<div style="display: flex;">
	<c:forEach var="mentoringReview" items="${mentoringReview}">
	   <div class="list_mar">
	      <!-- 멘토링 리뷰 리스트 -->
	      <div class="accepted_list">
	         <div class="small_jh">   
	         <!-- 별 평점 ★★★★☆  forEach 시작 -->
	            <div class="list_div">[평점]&nbsp;&nbsp;
	            <c:forEach begin="1" end="${mentoringReview.rating}">
	                 <i class="bi bi-star-fill" style="color:#F2B661;font-size:14pt;"></i>
	              </c:forEach>
	              <c:forEach begin="${mentoringReview.rating}" end="4">
	                 <i class="bi bi-star" style="color:#F2B661;font-size:14pt;"></i>
	              </c:forEach>
	           <!-- 별 평점 ★★★★☆  forEach 끝-->
	              </div>
	            <br><br>
	         <!-- 리뷰 내용 -->
	            <div class="list_div">[후기]&nbsp;&nbsp;${mentoringReview.content}</div>
	         </div>
	      </div>
	   </div>
	</c:forEach>
	</div>
</div>