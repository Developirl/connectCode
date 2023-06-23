<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>boardList</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">공지사항 관리</h1>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<button type="button"
							class="btn btn-outline btn-primary pull-right">
							<i class="fa fa-edit fa-fw"></i> 공지사항 작성
						</button>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">공지사항</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No.</th>
									<th>mentee_no</th>
									<th>title</th>
									<th>content</th>
									<th>writer</th>
									<th>date</th>
									<th>read_count</th>
									<th>comment_count</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="freeMentoringBoardDTO"
									varStatus="status">
									<c:if test="${status.index < 10}">
										<!-- index가 10보다 작을 때만 표시 -->
										<tr>
											<td>${freeMentoringBoardDTO.free_no}</td>
											<td>${freeMentoringBoardDTO.mentee_no}</td>
											<td>${freeMentoringBoardDTO.free_title}</td>
											<td>${freeMentoringBoardDTO.free_content}</td>
											<td>${freeMentoringBoardDTO.name}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${freeMentoringBoardDTO.free_regdate}" /></td>
											<td>${freeMentoringBoardDTO.readcount}</td>
											<td>${freeMentoringBoardDTO.free_comment_count}</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 페이징 처리 -->
					<div>
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.startPage > 1}">
							<a
								href="${pageContext.request.contextPath}/freeMentoring/freeMentoringList.do?page=${pageMaker.startPage - 1}">이전</a>
						</c:if>

						<!-- 페이지 번호 표시 -->
						<c:forEach var="pageNum" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<c:choose>
								<c:when test="${pageNum eq page}">
									<strong>${pageNum}</strong>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/freeMentoring/freeMentoringList.do?page=${pageNum}">${pageNum}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 다음 버튼 -->
						
						<c:if test="${pageMaker.endPage < pageMaker.pageCount}">
							<a
								href="${pageContext.request.contextPath}/freeMentoring/freeMentoringList.do?page=${pageMaker.endPage + 1}">다음</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
