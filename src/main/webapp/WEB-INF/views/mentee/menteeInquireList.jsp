<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%@ include file="../public/header.jsp" %>

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
            <div class="row">
                
                <div class="col-2">
                	<%@ include file="sidebar.jsp" %>
                </div>
                
                
                <div class="col-8">
                	<div style="text-align: right; margin-top:50px;"><button class="btn btn-secondary" id="wirteFormBtn">문의하기</button></div>
                	<table class="inquireTable">
                		<caption>1대1 문의 게시판</caption>
                		<tr>
                			<th style="width:10%">글번호</th>
                			<th style="width:50%">제목</th>
                			<th style="width:20%">등록일자</th>
                			<th style="width:20%">답변여부</th>
                		</tr>
                		<c:set var="num" value="${pageMaker.total-((pageMaker.currentPage-1)*10)}" />
                		<c:forEach var="inquire" items="${inquireList}">
							<tr>
								<td>${num}</td>
								<td><span class="inquireDetailBtn" data-value="${inquire.post_no}" style="cursor:pointer">${inquire.title}</span></td>
								<td><fmt:formatDate value="${inquire.reg_date}" pattern="yyyy-MM-dd"/></td>
								<td>
									<c:if test="${inquire.reply_yn.equals('Y')}">답변완료</c:if>
									<c:if test="${inquire.reply_yn.equals('N')}">답변대기중</c:if>
								</td>
							</tr>
							<c:set var="num" value="${num - 1}" />                			
                		</c:forEach>
                	</table>
                	
               		<div style="text-align:center; margin-top:50px;">
               			<c:if test="${pageMaker.prev}">
                		<a href="${pageMaker.startPage - 1}">Back&nbsp;&nbsp;</a>	
	                    </c:if>
	                    
	                    <c:forEach var="page" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                    	<c:choose>
	                    		<c:when test="${pageMaker.currentPage == page}">
	                    			<b>${page}</b>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<a href="/mentee/inquirList?pageNum=${page}">${page}</a>	
	                    		</c:otherwise>
	                    	</c:choose>
	                    </c:forEach>
	                    
	                    <c:if test="${pageMaker.next}">
	                		<a href="${pageMaker.endPage + 1}">&nbsp;&nbsp;Next</a>	
	                    </c:if>
                	</div>
                	
                </div>	
                <!-- <div class="col-8"> END -->
                
                
                <!-- 여백 -->
                <div class="col-2"></div>
            </div>
        </div>
        
        <br><br><br><br><br><br><br>
        
	<div class="mino-modal">
		<div class="mino-modal-body" align=center>
			<div class="mino-modal-cancelbutt" onclick="closeReserveDetailModal();">
				<i class="bi bi-x-circle"></i>
			</div>
			<form action="inquireWrite" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label">제목</label>
				  <input type="text" class="form-control" name="title" required="required">
				</div>
				<div class="mb-3">
				  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
				  <textarea class="form-control"  rows="3" name="content" required="required"></textarea>
				</div>
				<input type="hidden" name="pageNum" value="${pageMaker.currentPage}">
				<input type="submit" class="btn btn-secondary" value="작성하기">
			</form> 
		</div>
	</div>
	
	<div class="mino-content-modal">
		<div class="mino-modal-body" align=center>
			<div class="mino-modal-cancelbutt" onclick="closeReserveDetailModal();">
				<i class="bi bi-x-circle"></i>
			</div>
			<form action="inquireDelete" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="mb-3">
				  <label class="form-label">제목</label>
				  <input type="text" class="form-control" id="get_title" readonly="readonly">
				</div>
				<div class="mb-3">
				  <label class="form-label">내용</label>
				  <textarea class="form-control"  rows="3" id="get_content" readonly="readonly"></textarea>
				</div>
				<div class="mb-3">
				  <label class="form-label">답변</label>
				  <textarea class="form-control"  rows="3" id="get_reply" readonly="readonly"></textarea>
				</div>
				<input type="hidden" name="pageNum" value="${pageMaker.currentPage}">
				<input type="hidden" name="post_no" id="post_no">
				<input type="submit" class="btn btn-secondary" value="삭제하기">
			</form> 
		</div>
	</div>
        
        <script>
        	
        	$(document).ready(function(){
        		var check = "${check}";
        		if(check == "insert"){
        			alert("글 입력 완료");
        		}
        		if(check == "delete"){
        			alert("글 삭제 완료");
        		}
        	});
        
    		 // 모달 오픈하는 함수로, 오픈시킬 버튼에 onclick에서 함수 호출해주심 됩니다.
	        $("#wirteFormBtn").on("click", function() {
	            const modal = document.querySelector('.mino-modal');
	            modal.style.display = 'block';
	        });
    		 
	        // 모달 닫는 함수, onclick 에서 함수 호출
	        function closeReserveDetailModal(){
	            $(".mino-modal").css("display", "none");
	            $(".mino-content-modal").css("display", "none");
	        }
	        
	        $(".inquireDetailBtn").on("click", function(e){
	        	$.ajax({
	        		type : "GET",
	        		url : "/mentee/getInquire?post_no="+$(this).data("value"),
	        		success : function(data){
	        			$("#get_title").val(data.title);
	        			$("#get_content").val(data.content);
	        			if(data.reply == null){
	        				$("#get_reply").val("답변 대기중...");
	        			}else{
	        				$("#get_reply").val(data.reply);
	        			}
	        			$("#post_no").val(data.post_no);
	        			$(".mino-content-modal").css("display", "block");
	        		},
	        		error : function(){
	        			console.log("요청 실패");
	        		}
	        	});
	        });
        </script>
        
<%@ include file="../public/footer.jsp" %>        

        