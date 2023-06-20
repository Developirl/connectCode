<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

메인이다.
<!--  -->

<a href="https://kauth.kakao.com/oauth/logout?client_id=${restapikey}&logout_redirect_uri=http://localhost/member/logout"><button>로그아웃</button></a>
<button class="api-btn" onclick="unlinkApp()">회원탈퇴</button>

<script>
  function unlinkApp() {
		
	  var id = '${uuid}';
	  var adminkey = '${adminkey}';
	  var restapikey = '${restapikey}';
	  
	 $.ajax({
		  url: "https://kapi.kakao.com/v1/user/unlink",
		  type: "POST",
		  headers: {
		    "Authorization": "KakaoAK adminkey",
		    "Content-Type": "application/x-www-form-urlencoded"
		  },
		  data: {
		    target_id_type: "user_id",
		    target_id: id
		  },
		  success: function(response) {
		    // 성공적으로 요청을 보낸 후 실행할 코드
		    console.log("카카오 연결이 성공적으로 해제되었습니다.");
		    alert("성공적으로 탈퇴되었습니다. 로그아웃 해주세요.");
 		    location.href="https://kauth.kakao.com/oauth/logout?client_id=restapikey&logout_redirect_uri=http://localhost/member/kakaoexit";
		  },
		  error: function(xhr, status, error) {
		    console.log("카카오 연결 해제 중 오류가 발생했습니다.");
		    console.log(error);
		  }
		});
  }
</script>

</body>
</html>