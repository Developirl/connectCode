<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%@ include file="public/header.jsp" %>

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
            <div class="row mino-mainImg"></div>
            <div class="row">
                <div class="col-2"></div>
                
                
                
                <div class="col-8">
                
                <!-- 이달의 인기 멘토 시작 -->
                    <div class="container-fluid">
                        <br /><br />
                        <h3 style="font-weight: bold">이달의 인기 멘토</h3>
                        <br />
                        <div class="row">
                        	<c:forEach var="mentor" items="${pMentorList}" begin="0" end="3">
                        		<div class="col-3">
	                                <div class="mino-card" style="width: 18rem">
	                                    <img src="/download/${mentor.physical_name}" class="card-img-top" alt="profile_img" />
	                                    <div class="card-body mino-card-body">
	                                        <h6 class="mino-bold" style="margin-top: 10px" >${mentor.company}</h6>
	                                        <h5 class="card-title mino-bold" style="margin-bottom: 15px;">${mentor.name}</h5>
	                                        <span class="mino-bold">${fn:replace(mentor.technology,',',' ')}</span><br />
	                                        <span class="mino-bold">
	                                     		 <c:set var="i" value="${fn:indexOf(mentor.mentoring_location,'구 ')}"/>
	                                     		 ${fn:substring(mentor.mentoring_location,0,i+1)}&nbsp;&#183;&nbsp;${mentor.years}년차
	                                        </span>
	                                    </div>
	                                </div>
                            	</div>
                        	</c:forEach>
                        </div>
                        <br /><br />
                        <div class="row">
                        	<c:forEach var="mentor" items="${pMentorList}" begin="4" end="7">
                        		<div class="col-3">
	                                <div class="mino-card" style="width: 18rem">
	                                    <img src="${mentor.file_url}}" class="card-img-top" alt="profile_img" />
	                                    <div class="card-body mino-card-body">
	                                        <h6 class="mino-bold" style="margin-top: 10px" >${mentor.company}</h6>
	                                        <h5 class="card-title mino-bold" style="margin-bottom: 15px;">${mentor.name}</h5>
	                                        <span class="mino-bold">${fn:replace(mentor.technology,',',' ')}</span><br />
	                                        <span class="mino-bold">
	                                        	 <c:set var="i" value="${fn:indexOf(mentor.mentoring_location,'구 ')}"/>
	                                     		 ${fn:substring(mentor.mentoring_location,0,i)}&nbsp;&#183;&nbsp;${mentor.years}년차
	                                        </span>
	                                    </div>
	                                </div>
                            	</div>
                        	</c:forEach>
                        </div>
                    </div>
                    <!-- 이달의 인기 멘토 끝 -->
                    
                    <br><br><br><br><br>
                    
                    <!-- 최신 멘토 후기 START-->
                    <div class="container-fluid">
                    	<h3 style="font-weight: bold">최신 멘토 후기</h3>
                    	<br /><br />
                    	<table class="mino-reviewListTable">
                    		<tr>
                    			<th style="width:10%">멘토</th>
                    			<th style="width:15%">상담종류</th>
                    			<th style="width:35%">리뷰내용</th>
                    			<th style="width:10%">멘티</th>
                    			<th style="width:20%">평점</th>
                    			<th style="width:10%">작성일자</th>
                    		</tr>
                    		<c:forEach var="review" items="${rReviewList}">
                    			<tr>
                    				<td>${review.mentor_name}</td>
                    				<td>${review.mentoring_kind}</td>
                    				<td class="mino-reviewContent">${review.content}</td>
                    				<td>${review.mentee_name}</td>
                    				<td>
                    					<c:forEach begin="1" end="5" var="i">
                    						<c:if test="${i <= review.rating}">★</c:if>
                    						<c:if test="${i > review.rating}">☆</c:if>
                    					</c:forEach>
                    				</td>
                    				<td><fmt:formatDate value="${review.reg_date}" pattern="yyyy.MM.dd"/></td>
                    			</tr>
                    		</c:forEach>
                    	</table>
                    </div>
                    <!-- 최신 멘토 후기 END -->
                    
                </div>
                <!-- <div class="col-8"> END -->
                
                
                <div class="col-2"></div>
            </div>
        </div>
        
        <br><br><br><br><br><br><br>
        
<%@ include file="public/footer.jsp" %>        

        