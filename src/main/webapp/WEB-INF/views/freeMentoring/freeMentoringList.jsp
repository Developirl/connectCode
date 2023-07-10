<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 
 <script>
 $(document).ready(function(){
	var result = '${result}';
	
	if(result == "createfree"){
		alert("글 작성이 완료되었습니다.");
	}else if(result == 'deletefree'){
		alert("글 삭제가 완료되었습니다.");
	}

	 
 });
 
 
 </script>
<title>boardList</title>

<style type="text/css">
@import
   url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');
   
@import url('https://fonts.googleapis.com/css2?family=Domine:wght@600&family=Playfair+Display:ital,wght@1,500;1,600&display=swap'); 

.ys_pagerow{
margin-top: 150px;
margin-bottom: 80px;
}

.ys_freeheader{
/*font-family:'Noto Sans KR', sans-serif !important;*/
font-family: 'Domine', serif;
margin-top: 100px;
font-size:20pt;
}

.ys_writebut{
margin-right: 50px;
}

.ys_freetable #ys_freelisttr .ys_freetitle{
text-decoration: none;
}

.ys_pagerow .ys_allpage a.pagelink .active{
background-color: #808080!important;
}
.active{
background-color: #808080!important;
}


.ys_freetable a{
	color:black;
}
.ys_freetable a:hover{
	color:black;
}

.ys_freetable{
  margin-top:60px;
  table-layout: fixed;
  white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
  overflow: hidden; /* 요소 내부에서 넘치는 부분은 숨김 */
}

.ys_freetable th:hover{
	background-color: none;
}
.freementoringList_title{
  white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
  overflow: hidden; /* 요소 내부에서 넘치는 부분은 숨김 */
  text-overflow: ellipsis;
}

.overflow {
  white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
  overflow: hidden; /* 요소 내부에서 넘치는 부분은 숨김 */
  text-overflow: ellipsis;
  width:100%;
}
.ys_freetable{
	width:100%;
}

.ys_freetable tr{
	width:100%;
}


.form-control{
	padding:3px 10px!important;
}

.freeMentoring_butt{
	border:1px solid #004EA2;
	padding:3px 10px;
	color:#004EA2;
	background:white;
	font-weight: 500;
	border-radius: 5px;
}
.freeMentoring_butt:hover{
	background:#004EA2;
	color:white;
}
/* 내가 사용하는 개인 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');
.jisoo-noto-font{
    font-family: 'Noto Sans KR', sans-serif!important;
    color:#808080!important;
}

.page-item:active {
	background: #808080!important;
    color:white!important;
}

.active>.page-link{
	background:#808080!important;
	border-color:#808080!important;
	color:white!important;
}
.active>.page-link:hover{
	font-weight: bold;
}


.jisoo-free-container{
	text-align: center!important;
	margin:0 auto!important;
	align-content: center;
	align-items: center;
}


.pagination{
	width:15%;
	text-align: center!important;
	margin:0 auto!important;
	align-content: center;
	align-items: center;
}


</style>

<%@include file="../public/header.jsp" %>
</head>
<body>

	<div class="page-wrapper" align="center">
		<div class="container-fluid">
			<div class="row">
			<div class="col-lg-2"></div>
				<!--게시판 넓이 -->
				<div class="col-lg-8">
					<h2 class="page-header ys_freeheader">Free Mentoring</h2>
				
				<div class="jisoo-modify-font">
						<br><br><br>
                  		<form action="/freeMentoring/freeMentoringList.do" style="display: flex;">
                     		<div class="form-row" style="display: flex; align-items: center;">
                        	<div class="col-auto" style="display: flex; align-items: center;">
                           <label for="searchType" style="margin-right: 5px;">
							<select class="form-control" id="searchType" name="search" style="margin-right: 5px;">
                                 <option value="name" style=" padding-left: 8px;" <c:if test="${freeboard.search=='name'}">selected="selected"</c:if>>&nbsp;작성자</option>
								<option value="free_title" <c:if test="${freeboard.search=='free_title'}">selected="selected"</c:if>>&nbsp;&nbsp;제목</option>
								<option value="free_regdate" <c:if test="${freeboard.search=='free_regdate'}">selected="selected"</c:if>>&nbsp;작성일</option>
                           </select>
                           </label>
                        </div>
                        <div class="col-auto" style="display: flex; align-items: center; margin-right: 5px;">
                           <label for="keyword">
                              <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색할 키워드를 입력해주세요.">
                           </label>
                        </div>
                        <div class="col-auto">
                           <button type="submit" class="freeMentoring_butt">검색</button>
                        </div>
                     </div>
                  </form>
				<!-- <div class="panel panel-default">
					<br>
					<div class="panel-body"> -->
						<table class="table table-hover ys_freetable">
						 <thead>
								<tr align="center">
									<th width="5%">No.</th>
									<th width="54%" class="freementoringList_title">제목</th>
									<th width="10%">작성자</th>
									<th width="10%">작성일</th>
									<th width="8%">조회수</th>
									<th width="8%">답글수</th>
								</tr>
								<c:if test="${empty list }">
								<tr>
									<th colspan="6" style="text-align: center; padding:50px 0;">검색한 키워드에 대한 결과가 없습니다. </th>
								</tr>
								</c:if>
						</thead>
						
						<tbody>	
							
								<c:if test="${ ! empty list }">
									<c:set var="num" value="${pageMaker.number}"></c:set>
									<c:forEach items="${list}" var="free">
										<c:if test="${not empty list}">
											
											<tr align="center" id="ys_freelisttr">
												<td ><c:out value="${num}"></c:out> </td>
												<td class="freementoringList_title">
												
												<c:if test="${empty freeboard.keyword}">
												<div class="overflow">
													<a class="ys_freetitle"
													href="freeMentoringDetail.do?free_no=${free.free_no}&page=${pageMaker.currentPage}">
													${free.free_title}
													</a>
												</div>	
												</c:if>
												
												<c:if test="${ not empty freeboard.keyword}">
												<div class="overflow">
													<a class="ys_freetitle"
													href="freeMentoringDetail.do?free_no=${free.free_no}&page=${pageMaker.currentPage}&search=${freeboard.search}&keyword=${freeboard.keyword}">
													${free.free_title}
													</a>
												</div>	
												</c:if>
												
												</td>
												<td>${free.name}</td>
												<td ><fmt:formatDate pattern="yyyy-MM-dd"
														value="${free.free_regdate}" /></td>
												<td>${free.readcount}</td>
												<td>${free.free_comment_count}</td>
											</tr>
										</c:if>
										<c:set var="num" value="${num-1}"></c:set>
									</c:forEach>
								</c:if>		
								
						</tbody>		
						</table>
						
					
					</div>
					<br>
					<c:if test="${mentee_no != 0 }">
					<form action="/freeMentoring/freeMentoringCreate.do" method="get" align=right >
 					<button type="submit" class="freeMentoring_butt" >글 작성</button>
					</form>
					</c:if>
					<br><br><br>
					<!-- 페이징 처리 -->
					<div class="jisoo-free-container">
					
						<c:if test="${empty freeboard.search or empty freeboard.keyword}">
						<!-- 전체페이지 -->
						<ul class="pagination ">
							<!-- 이전 버튼 -->
							
							<c:if test="${pageMaker.currentPage > 1}">
	    					<li class="page-item">
	    					<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage - 1}">Back</a></li>
							</c:if>
							
							<c:if test="${pageMaker.currentPage <= 1}">
	    					<li class="page-item">
	    					<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage}">Back</a></li>
							</c:if>
	
							<!-- 페이지 번호 표시 -->
							<c:forEach var="i" begin="${pageMaker.startPage == 0 ? 1 : pageMaker.startPage }"
								end="${pageMaker.endPage == 0 ? 1 : pageMaker.endPage}" step="1">
								
								<li class="page-item ${pageMaker.currentPage == i ? 'active':''}" >
								<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${i}">${i}</a></li>
								
							</c:forEach>
	
							<!-- 다음 버튼 -->
							<c:if test="${pageMaker.currentPage >= pageMaker.pageCount}">
	    						<li class="page-item">
	    						<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage}">Next</a></li>
							</c:if>
							
							<c:if test="${pageMaker.currentPage < pageMaker.pageCount}">
	    						<li class="page-item">
	    						<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage + 1}">Next</a></li>
							</c:if>
							
						</ul>
						</c:if>
						
						<!-- 검색했을때 -->
						<c:if test="${not empty freeboard.search and not empty freeboard.keyword}">
						<ul class="pagination ">
							<!-- 이전 버튼 -->
							
							<c:if test="${pageMaker.currentPage > 1}">
	    					<li class="page-item">
	    					<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage - 1}&search=${freeboard.search}&keyword=${freeboard.keyword}">Back</a></li>
							</c:if>
							
							<c:if test="${pageMaker.currentPage <= 1}">
	    					<li class="page-item">
	    					<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage}&search=${freeboard.search}&keyword=${freeboard.keyword}">Back</a></li>
							</c:if>
	
							<!-- 페이지 번호 표시 -->
							<c:forEach var="i" begin="${pageMaker.startPage == 0 ? 1 : pageMaker.startPage }"
								end="${pageMaker.endPage == 0 ? 1 : pageMaker.endPage}" step="1">
								<li class="page-item ${pageMaker.currentPage == i ? 'active':''}">
								<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${i}&search=${freeboard.search}&keyword=${freeboard.keyword}">${i}</a></li>
	
							</c:forEach>
	
							<!-- 다음 버튼 -->
							<c:if test="${pageMaker.currentPage >= pageMaker.pageCount}">
	    						<li class="page-item">
	    						<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage}&search=${freeboard.search}&keyword=${freeboard.keyword}">Next</a></li>
							</c:if>
							
							<c:if test="${pageMaker.currentPage < pageMaker.pageCount}">
	    						<li class="page-item">
	    						<a class="page-link jisoo-noto-font" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage + 1}&search=${freeboard.search}&keyword=${freeboard.keyword}">Next</a></li>
							</c:if>
							
						</ul>
						</c:if>
					
					</div>
					
					<br><br><br>
					
					</div>
				</div>
				
				</div>
				
				<div class="col-lg-2"></div>
				
				
				</div>
		<!-- 	</div>
	</div> -->
	<%@include file="../public/footer.jsp" %>
</body>
</html>
