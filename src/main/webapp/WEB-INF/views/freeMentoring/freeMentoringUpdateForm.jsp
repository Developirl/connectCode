<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <!-- 부트스트랩 CDN -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');

    .container * {
      font-family: 'Noto Sans KR', sans-serif !important;
    }

    .container {
      margin-top: 50px;
      margin-left: 400px;
      margin-right: 300px;
      display: flex;
      justify-content: center;
    }

    /* 버튼 오른쪽 정렬 */
    .button-container {
      display: flex;
  	  justify-content: flex-end;
  	  align-items: center;
  	  margin-top: 20px;
    }
    
    .ys_updatelistbut{
    	margin-right: 260px;
  		margin-left: 15px;
    }
    
    .ys_freeupdateheader{
		font-size: 40px;
		margin-left: 730px;
		margin-top: 50px;
	}
    
  </style>
</head>
<body>
  <%@include file="../public/header.jsp"%>
  <br>
  <div class="container">
    <form action="/freeMentoring/freeMentoringUpdate.do" method="post">
  	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <div class="form-group">
      	<input type="hidden" name="page" value="${page}">
        <input type="hidden" name="free_no" value="${DTO.free_no}">
        <input type="hidden" name="mentee_no" value="${DTO.mentee_no}">
        <label for="name">작성자</label><br>
        <input type="text" name="name" value="${DTO.name}" readonly="readonly"><br><br>
        <label for="title">제목</label>
        <input type="text" id="title" name="free_title" value="${DTO.free_title }" class="form-control">
      </div>
      <div class="form-group">
        <label for="content">내용</label>
        <textarea id="content" name="free_content" class="form-control" rows="20" cols="80">${DTO.free_content}</textarea>
      </div>
      <div class="button-container">
        <button type="submit" class="btn btn-primary">수정하기</button>
        <a href="/freeMentoring/freeMentoringList.do?page=${page}" class="btn btn-secondary ys_updatelistbut">목록으로</a>
      </div>
      <br>
    </form>
  </div>
  <%@include file="../public/footer.jsp"%>
</body>
</html>
