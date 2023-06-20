function myAccFunc() {
	var x = document.getElementById("demoAcc");
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
		/* x.previousElementSibling.className += " w3-green"; */
		localStorage.setItem("dropdownState", "open");
	} else {
		x.className = x.className.replace(" w3-show", "");
		/*
		 * x.previousElementSibling.className =
		 * x.previousElementSibling.className.replace(" w3-green", "");
		 */
		localStorage.setItem("dropdownState", "closed");
	}
}

//페이지가 로드될 때 이전 드롭다운 박스 상태를 확인하여 복원
window.addEventListener("load", function() {
  var dropdownState = localStorage.getItem("dropdownState");
  if (dropdownState === "open") {
    var x = document.getElementById("demoAcc");
    x.className += " w3-show";
    /*x.previousElementSibling.className += " w3-green";*/
  }
});