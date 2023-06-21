<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Angkor&display=swap');

.ys_headline{
    font-family: 'Angkor', cursive;
    font-size: 70px;
    }
    
.ys_headline2{
    font-family: 'Angkor', cursive;
    font-size: 70px;
    color: rgb(66, 18, 143);
    }

.joinimg{
    margin-top: 20px;
    width: 210px; 
    height: 200px;
    }
    .successfont{
        
    }
    .success{
        font-size: 50px;       
    }
    .successfont button{
    border: none;
	width: 200px;
	height: 50px;
	border-radius: 5px;
	background-color: #0080FF;
	color: white;
	font-weight: bold;
    font-size: 19px
    }
    .homebut{
        margin-right: 15px;
    }
    .successfont button:hover{
        background-color: darkgray;
    }
</style>
</head>

<div align="center">
<span class="ys_headline">connect</span><span class="ys_headline2">Code</span>
</div>

<div align="center" class="successfont">
<img class="joinimg" src="/member/images/joinsuccess.jpg">
    <h1 class="success">회원가입완료</h1>
    <h2>회원가입이 완료되었습니다.<br>
    로그인 후 서비스를 이용해주세요.</h2>
    <br>
<a href="/"><button type="button" class="ys_homebut">Home</button></a>
<a href="/member/loginform"><button type="button">Login</button></a>
</div>

</body>
</html>