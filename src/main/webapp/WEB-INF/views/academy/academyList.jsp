<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>학원정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Angkor&display=swap" rel="stylesheet">

</head>
<body>

<style>
<!--
* {
	font-family:'Noto Sans KR', sans-serif;
}

.container {
	display: flex;
	flex-wrap: wrap;
	justify-content: left;
	align-items: left;
	height: 100vh;
}

.menu {
	display: flex;
	flex-direction: column;
	align-items: left;
	/* text-shadow: gray 0.1em 0.1em 0.1em; */
	width: 100%;
	max-width: 1400px;
	margin: 0 auto;
}

.card-container {
	display: grid;
	/* grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); */
	grid-template-columns: repeat(2, 1fr);
  	grid-template-rows: repeat(2, 1fr);
	gap: 20px;
	margin-top: 50px;
	row-gap: 20px;
}

.card {
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	max-width: 350px;
	width: 100%;
	height: 400px;
	border-radius: 10px;
	/* box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3); */
	overflow: hidden;
	background-size: cover;
	/* background-image:url("../academy/img/Hrd_net.jpg"); */
	border-color:  rgba(0, 0, 0, 0);
	position: relative;

}

.card p {
	padding: 5px;
	margin: 0;
	color: #fff;
	background-color: #0090f980;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}

.card h2{
	padding: 5px;
	margin: 0;
	color: #fff;
	background-color: #0090f980;
	font-size: 17px;
	font-weight: bold;
	text-align: center;
}

.card h3{
	padding: 5px;
	margin: 0;
	color: #fff;
	background-color: #0090f980;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

button{
	font-family:'Noto Sans KR', sans-serif;
}

.page-link{
font-family:'Noto Sans KR', sans-serif;
}

.page-item.active .page-link {
  border: none;
  font-family:'Noto Sans KR', sans-serif;
  background-color: #0090f980; 
  color: white; 
}

a.page{
text-decoration: none;
color: #33a8ff;
}

.card img{
 width: 50%;
 height: auto;
 display: block;
 margin: auto;
}

.start{
display: flex;
}

#searchInput::placeholder{
color:#b8bebe;
}

.realMan{
width: 280px;
height: 50px;
border-top: none;
border-left: none;
border-right: none;
border-bottom: 3px solid black;
}

-->
</style>

	<div id="frame">
		<!-- 네비게이션 바/부트스트랩 -->
		<%@ include file="../public/header.jsp"%><br>
		
		<!-- 실제 콘텐츠 들어가는 부분 -->
		<h4 style="font-size: 30px; position: static; margin: 10px; font-family: 'Noto Sans KR', sans-serif; color: #1c8dff;"
		class="text" align="center">국비 훈련과정 목록</h4>
		<div class="container-fluid main-content">
			<div class="row"  style="padding-left: 60px;">
				<div class="col-2"></div>
				<div class="col-8">
					<!--  @@@@@@@@@@@@@@@여기다가 작업하세요@@@@@@@@@@@@@@@ -->
	<br>
	
	
	<!-- 검색창 -->
	<div class="search-container" style="padding-left: 260px;">
	<label style="position: static; margin: 10px; font-family: 'Noto Sans KR', sans-serif;" for="searchInput"
	 ><svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></label>
	<input id="searchInput" type="text" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학원명 또는 과정명을 입력" class="realMan">
	</div>
	
	<!-- 필터링 버튼 -->
	<!-- <button id="whole" type="button" class="btn btn-outline-primary">전체 행사</button>
	<button id="past" type="button" class="btn btn-outline-secondary">지난 행사</button>
	<button id="current" type="button" class="btn btn-outline-primary">진행 행사</button>
	<button id="future" type="button" class="btn btn-outline-secondary">예정 행사</button> -->
	
	<div class="container-fluid">
		<div class="menu">
			<div class="card-container"></div><br><br>
			<div class="d-flex justify-content-center" style="padding-right: 80px;">
				<nav aria-label="Page navigation example">
					<ul class="pagination"></ul>
				</nav>
			</div>
		</div>
	</div>

	<script>
	$(document).ready(function() {
	  let currentPage = 1;

	  function showCards(startIndex, endIndex) {
	    $(".card-container").children(".card").hide().slice(startIndex, endIndex).show();
	  }

	  function handlePaginationClick() {
	    let pageNum = $(this).text();
	    let startIndex = (pageNum - 1) * 4;
	    let endIndex = startIndex + 4;

	    showCards(startIndex, endIndex);

	    // 페이지 번호에 활성 클래스를 추가
	    $(".pagination").find(".page").removeClass("active");
	    $(this).addClass("active");

	    // 현재 페이지 저장
	    currentPage = parseInt(pageNum);

	    // URL 업데이트
	    updateURLWithPage(currentPage);
	  }

	  function updateURLWithPage(page) {
	    let newURL = window.location.pathname + "?page=" + page;
	    window.history.replaceState(null, null, newURL);
	  }

	  function loadCards() {
	    $.ajax({
	      // 수정된 API 주소 입력 (https://cors-anywhere.herokuapp.com/)
		  url:"https://www.hrd.go.kr/hrdp/api/apipo/APIPO0101T.do?srchTraEndDt=20230630&pageSize=100&srchTraArea1=11&crseTracseSe=C0061,C0104&srchTraStDt=20230628&sortCol=TRNG_CRSN&authKey=Pw96YgGqSYb5Q3dMHCSwjBybzhZH5ffU&sort=ASC&returnType=JSON&srchNcs1=20&outType=1&pageNum=1&srchNcs2=2001&srchNcs3=200102&srchTraPattern=N1&srchPart=-99&apiRequstPageUrlAdres=/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp&apiRequstIp=221.146.253.123",
	      type: "GET",
	      dataType: "json",
	      success: function(result) {
//	        console.log(result);
//	        console.log(typeof result);
//	        console.log(result.returnJSON);

	        let parsedResult = JSON.parse(result.returnJSON);
	        let srchLists = parsedResult.srchList;

	        srchLists.sort(function(a, b) {
	          return b.traStartDate.localeCompare(a.traStartDate);
	        });

//	        let cardContainer = $(".card-container").addClass("card-container");
	        let cardContainer = $(".card-container");
	        cardContainer.empty(); // 기존 카드 삭제
	          let imagePath = "..//academy/img/Hrd_net.png";

	        for (let i = 0; i < srchLists.length; i++) {
	          let item = srchLists[i];
	          let card = $("<div>").addClass("card");
	          let image= '<img src="/academy/img/Hrd_net.png">';
	          let title = $("<h2>").text(item.title); // 제목
	          let subTitle = $("<h3>").text(item.subTitle); // 학원이름
	          let address = $("<p>").text(item.address); // 주소
	          let realMan = $("<p>").text(item.realMan); // 수강비
	          let telNo = $("<p>").text(item.telNo); // 전화번호
	          let date = $("<p>").text("훈련기간  :  " + item.traStartDate + " ~ " + item.traEndDate); // 날짜
	          //let training = $("<p>").text("훈련기간");
	          let link = $("<a>").text(item.titleLink);
	          let br = $("<br>");
	          //let start = $("<div>").addClass("start")
	          //.append(training).append(date)

	          card.append(image)
	            .append(title)
	            .append(subTitle)
	            .append(date)
	            
	            /* .append(br)
	            .append(address)
	            .append(realMan)
	            .append(telNo)
	            ; */
	            //card.css("background-color", "rgba(0,144,249,.5)");
	            //card.css("background-image", "url('/academy/img/Hrd_net.png')");

	          cardContainer.append(card);
	          
	          card.click(function() {
	            window.location.href = item.titleLink;
	          });

	        }

	        let totalCards = srchLists.length;
	        let totalPages = Math.ceil(totalCards / 4);

	        $(".pagination").empty(); // 기존 페이지 링크 삭제

	        for (let i = 1; i <= totalPages; i++) {
	        	  let pageLink = $("<a>").attr("href", "#").addClass("page").text(i);
	        	  let listItem = $("<li>").addClass("page-item").append($("<span>").addClass("page-link").append(pageLink));

	        	  if (i === currentPage) {
	        	    listItem.addClass("active");
	        	  }

	        	  listItem.on("click", function() {
	        		    $(".pagination .page-item").removeClass("active");
	        		    $(this).addClass("active");
	        		    // 페이지 이동 코드 추가
	        		    window.location.href = "academy?page="+i;
	        		  });

	        	  pageLink.on("click", function(event) {
	        	    event.preventDefault(); // 기본 동작인 페이지 이동을 막음
	        	    listItem.trigger("click"); // listItem를 클릭한 것처럼 이벤트 트리거
	        	  });

	        	  $(".pagination").append(listItem);
	        	}



	        showCards((currentPage - 1) * 4, currentPage * 4);
	      },
	    });
	  }

	  function loadPageFromURL() {
	    let urlParams = new URLSearchParams(window.location.search);
	    let page = urlParams.get("page");
	    if (page) {
	      currentPage = parseInt(page);
	    }
	  }

	  $(".pagination").on("click", ".page", handlePaginationClick);

	  loadPageFromURL();
	  loadCards();
	});
	
	// 검색 기능
    $("#searchInput").on("keyup", function() {
      let value = $(this).val().toLowerCase();
      $(".card").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
      });
    });
	</script>

</div>
</div>
<div class="col-2"></div>
</div>
</div>
<%@ include file="../public/footer.jsp"%>

</body>
</html>
