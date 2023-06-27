<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>



	<input type="button" value="되라결제" onclick="requestPay()">

<script>

//시큐리티용 코드 
var csrf = "${_csrf.headerName}";
var csrfToken = "${_csrf.token}";

//고유한 주문번호 생성하기
function createOrderNum(){
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");
	
	let orderNum = year + month + day;
	for(let i=0;i<10;i++) {
		orderNum += Math.floor(Math.random() * 8);	
	}
	
	return orderNum;
}


//--------------------결제를 위한 영역
function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    var uid = '';
    IMP.init("imp04314513");
    IMP.request_pay({ // param
        pg: 'kakaopay',
        pay_method: "card",
        merchant_uid: createOrderNum(), //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "30분 대면 멘토링", //결제창에 노출될 상품명
        amount: 300, //금액
        buyer_email : "userEmail@naver.com", 
        buyer_name : "jihyn",
        buyer_tel : "01022223333",
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            uid = rsp.imp_uid;
            console.log('1번 '+JSON.stringify(rsp));
            console.log('2번 '+rsp);
    
    
            // 결제검증
            $.ajax({
                url: '/payment/order/verify_iamport/' + rsp.imp_uid,
                type: 'post',
                beforeSend: function(xhr){
                	xhr.setRequestHeader(csrf,csrfToken);
                }
            }).done(function(data) {
                // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
                if (300 == data.response.amount) {
                    // jQuery로 HTTP 요청
                    // 주문정보 생성 및 테이블에 저장 
		        	
                        // 데이터를 json으로 보내기 위해 바꿔준다.
                        requestData = JSON.stringify({
                        	"payment_method" : rsp.pay_method, 
                            "order_no" :  rsp.merchant_uid,
                            "pay_amount" : rsp.paid_amount,
                            "pay_state" : rsp.status,
                            "pay_time" : new Date().getTime(),
                            "iamport_order_no" : rsp.imp_uid,
                            "buyer_name" : rsp.buyer_name,
                            "buyer_email" : rsp.buyer_email,
                            "buyer_tel" : rsp.buyer_tel
                            //"productNum" : detailNum.textContent, //상품번호
                            //"num" : userNum.value, // 회원번호
                            //"productName" : rsp.name,
                            //"orderDate" : new Date().getTime(),
                            //"reserNum" :  reserNum.textContent // 예약정보를 담고있는번호
                        });
                    
					
                        $.ajax({
                            url: "/payment/order/complete", 
                            type: "POST",
                            dataType: 'json',
                            contentType: 'application/json',
                            beforeSend: function(xhr){
                            	xhr.setRequestHeader(csrf,csrfToken);
                            },
                            data : requestData,
                        }).done(function(res) {
                            if (res > 0) {
                                //createPayInfo(uid);
                            }
                            else {
                            }
                        })
                }
                else {
                    alert('결제 실패');
                }
            })
            } else {
                alert("결제에 실패하였습니다.","에러 내용: " +  rsp.error_msg,"error");
            }
        });
}

</script>

</body>
</html>