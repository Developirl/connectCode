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

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap')
;

* {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.container {
  margin-top: 50px;
  margin-left: 400px;
  margin-right: 300px;
  display: flex;
  justify-content: center;
}

.button-container {
  display: flex;
  justify-content: flex-end;
}

.ys_freecreateheader{
font-size: 40px;
margin-left: 730px;
}

.ys_insertlistbut{
  margin-right: 260px;
  margin-left: 15px;
}

</style>

</head>
<body>
<%@include file="../public/header.jsp"%>
	<br>
	<div>
   	<span class="ys_freecreateheader">Free Mentoring 글 작성</span>
   	</div>
   <div class="container">
   <!-- 토큰 삽입 -->
      <form action='/freeMentoring/freeMentoringCreate.do' method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <div class="form-group">
        	
        	<input type="hidden" name="mentee_no" value="${mentee.mentee_no}">
        	
        	<label for="name">작성자</label><br>
        	<input type="text" name="name" value="${mentee.name}" readonly><br><br>
        	
              <label for="title">제목</label>
            <input type="text" id="title" name="free_title" class="form-control">
          </div>
     
          <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="free_content" class="form-control"
             rows="20" cols="80"></textarea>
          </div>
        <div class="button-container">
          <button type="submit" class="btn btn-primary">글작성</button>
          <a href="/freeMentoring/freeMentoringList.do" class="btn btn-secondary ys_insertlistbut">목록으로</a>
        </div>
        <br>
      </form>
   </div>
	<%@include file="../public/footer.jsp"%>

</body>
</html>
