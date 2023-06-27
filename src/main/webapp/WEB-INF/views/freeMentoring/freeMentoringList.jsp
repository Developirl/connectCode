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

.ys_pagerow{
margin-top: 100px;
margin-bottom: 30px;
}

.ys_freeheader{
font-family:'Noto Sans KR', sans-serif !important;
margin-top: 20px;
}

.ys_pagerow ul{
margin-left: 360px;
vertical-align: middle;
}
.ys_writebut{
margin-right: 50px;
}

.ys_freetable #ys_freelisttr .ys_freetitle{
text-decoration: none;
}

.ys_pagerow .ys_allpage a.pagelink .active{
background-color: blue;
}

</style>

<%@include file="../public/header.jsp" %>
</head>
<body>

	<div class="page-wrapper" align="center">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h2 class="page-header ys_freeheader">Free Mentoring</h2>
				</div>
				<div class="row">

						<div class="row align-items-center" align="right" style="margin-left: 750px;">
               			<div class="col-lg-2 offset-lg-1" style="display: flex;">
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
                           <button type="submit" class="btn btn-primary">검색</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
				<div class="panel panel-default">
					<br>
					<div class="panel-body">
						<table class="table table-hover ys_freetable">
							<thead>
								<tr align="center">
									<th>No.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>답글수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
								<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<th align="center"><h2>데이터가 없습니다.</h2></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								</tr>
								</c:if>
							
							
							
								<c:set var="num" value="${pageMaker.number}"></c:set>
								<c:forEach items="${list}" var="free">
									<c:if test="${not empty list}">
										
										<tr align="center" id="ys_freelisttr">
											<td style="width: 15%;"><c:out value="${num}"></c:out> </td>
											<td style="width: 20%;">
											
											<c:if test="${empty freeboard.keyword}">
											<a class="ys_freetitle"
											href="freeMentoringDetail.do?free_no=${free.free_no}&page=${pageMaker.currentPage}">${free.free_title}</a>
											</c:if>
											
											<c:if test="${not empty freeboard.keyword}">
											<a class="ys_freetitle"
											href="freeMentoringDetail.do?free_no=${free.free_no}&page=${pageMaker.currentPage}&search=${freeboard.search}&keyword=${freeboard.keyword}">${free.free_title}</a>
											</c:if>
											
											</td>
											<td>${free.name}</td>
											<td style="width: 25%;"><fmt:formatDate pattern="yyyy-MM-dd  HH:mm"
													value="${free.free_regdate}" /></td>
											<td>${free.readcount}</td>
											<td>${free.free_comment_count}</td>
										</tr>
									</c:if>
									<c:set var="num" value="${num-1}"></c:set>
								</c:forEach>
							</tbody>
						</table>
						
					</div>
					</div>
					<br>
					<c:if test="${mentee_no != 0 }">
					<form action="/freeMentoring/freeMentoringCreate.do" method="get" style="margin-bottom:50px;" >
 					<button type="submit" class="btn btn-outline btn-primary ys_writebut" style="float:right;">글 작성</button>
					</form>
					</c:if>
					
					<!-- 페이징 처리 -->
					<div class="row ys_pagerow" align="center">
						<c:if test="${empty freeboard.search or empty freeboard.keyword}">
						<!-- 전체페이지 -->
						<ul class="pagination ys_allpage">
						<!-- 이전 버튼 -->
						<li class="page-item">
    					<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=1">FirstPage</a></li>
						
						<c:if test="${pageMaker.currentPage > 1}">
    					<li class="page-item">
    					<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage - 1}">Previous</a></li>
						</c:if>
						
						<c:if test="${pageMaker.currentPage <= 1}">
    					<li class="page-item">
    					<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage}">Previous</a></li>
						</c:if>

						<!-- 페이지 번호 표시 -->
						<c:forEach var="i" begin="${pageMaker.startPage == 0 ? 1 : pageMaker.startPage }"
							end="${pageMaker.endPage == 0 ? 1 : pageMaker.endPage}" step="1">
							
							<li class="page-item ${pageMaker.currentPage == i ? 'active':''}" >
							<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${i}">${i}</a></li>
							
						</c:forEach>

						<!-- 다음 버튼 -->
						<c:if test="${pageMaker.currentPage >= pageMaker.pageCount}">
    						<li class="page-item">
    						<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage}">Next</a></li>
						</c:if>
						
						<c:if test="${pageMaker.currentPage < pageMaker.pageCount}">
    						<li class="page-item">
    						<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage + 1}">Next</a></li>
						</c:if>
						
						<li class="page-item">
    					<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.pageCount == 0 ? 1 : pageMaker.pageCount}">LastPage</a></li>
						</ul>
						</c:if>
						
						<!-- 검색했을때 -->
						<c:if test="${not empty freeboard.search and not empty freeboard.keyword}">
						<ul class="pagination ys_allpage2">
						<!-- 이전 버튼 -->
						<li class="page-item">
    					<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=1&search=${freeboard.search}&keyword=${freeboard.keyword}">FirstPage</a></li>
						
						<c:if test="${pageMaker.currentPage > 1}">
    					<li class="page-item">
    					<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage - 1}&search=${freeboard.search}&keyword=${freeboard.keyword}">Previous</a></li>
						</c:if>
						
						<c:if test="${pageMaker.currentPage <= 1}">
    					<li class="page-item">
    					<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage}&search=${freeboard.search}&keyword=${freeboard.keyword}">Previous</a></li>
						</c:if>

						<!-- 페이지 번호 표시 -->
						<c:forEach var="i" begin="${pageMaker.startPage == 0 ? 1 : pageMaker.startPage }"
							end="${pageMaker.endPage == 0 ? 1 : pageMaker.endPage}" step="1">
							<li class="page-item ${pageMaker.currentPage == i ? 'active':''}">
							<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${i}&search=${freeboard.search}&keyword=${freeboard.keyword}">${i}</a></li>

						</c:forEach>

						<!-- 다음 버튼 -->
						<c:if test="${pageMaker.currentPage >= pageMaker.pageCount}">
    						<li class="page-item">
    						<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage}&search=${freeboard.search}&keyword=${freeboard.keyword}">Next</a></li>
						</c:if>
						
						<c:if test="${pageMaker.currentPage < pageMaker.pageCount}">
    						<li class="page-item">
    						<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.currentPage + 1}&search=${freeboard.search}&keyword=${freeboard.keyword}">Next</a></li>
						</c:if>
						
						<li class="page-item">
    					<a class="page-link" href="/freeMentoring/freeMentoringList.do?page=${pageMaker.pageCount == 0 ? 1 : pageMaker.pageCount}&search=${freeboard.search}&keyword=${freeboard.keyword}">LastPage</a></li>
						</ul>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp" %>
</body>
</html>
