<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login Board</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css" href="/member/css/constract.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/member/js/constract.js"></script>


</head>
<body>
	 <%-- <%@ include file="../public/header.jsp" %> --%>
	<!-- 실제 콘텐츠 들어가는 부분 -->
	<div class="container-fluid main-content">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8"><br><br>
				<!--  @@@@@@@@@@@@@@@여기다가 작업하세요@@@@@@@@@@@@@@@ -->
				
				<form action="/member/mentorJoinForm" id="constractForm" onsubmit="return check()">
				<div class="col-3 mino-title">CONNECT&nbsp;<span style="color: rgb(66, 18, 143);">Code</span></div>
				<h5 align="center" class="constractTitle">서비스 이용약관</h5><br>
					<ul class="join_box">
						<li class="checkBox check01">
							<ul class="clearfix">
								<li><span class="bi-check-all"></span>
								이용약관, 개인정보 수집 및 이용 에 모두 동의합니다.</li>
								<li class="checkAllBtn"><input type="checkbox"
									name="chk" id="check_all" class="chkAll"></li>
							</ul>
						</li>
						<li class="checkBox check02">
							<ul class="clearfix">
								<li><span class="bi-check-lg"></span>&nbsp;이용약관 동의(필수)</li>
								<li class="checkBtn"><input type="checkbox" name="chk">
								</li>
							</ul> <textarea cols=110 rows=13 style="resize: none" class="form-control">
[이용약관] 

 제1조(목적) 
 이 약관은 회사(전자상거래 사업자)가 운영하는 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

 제2조(정의)
 ① “몰”이란 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
  
 ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

 제3조 (약관 등의 명시와 설명 및 개정)
 ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
 
 ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
 
 ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
							</textarea>
						</li>
						<li class="checkBox check03">
							<ul class="clearfix">
								<li><span class="bi bi-check-lg"></span>&nbsp;
								개인정보 수집 및 이용에 대한 동의(필수)</li>
								<li class="checkBtn"><input type="checkbox" name="chk">
								</li>
							</ul> <textarea cols=110 rows=13 style="resize: none" class="form-control">
[개인정보 수집 및 이용]
				
가. 개인정보의 수집 및 이용 목적 국가공간정보포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 

나. 정보주체와 법정대리인의 권리ㆍ의무 및 행사방법 
① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다. 

② 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다. 

③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. 

④ 개인정보 열람 및 처리정지 요구는 개인정보 보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다. 

⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다. 

⑥ 정보주체 권리에 따른 열람의 요구, 정정ㆍ삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다. 다. 수집하는 개인정보의 항목 국가공간정보포털 회원정보(필수): 이름, 이메일(아이디), 비밀번호 라. 개인정보의 보유 및 이용기간 국가공간정보포털은 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다. - 수집근거: 정보주체의 동의 - 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의) - 보존근거: 정보주체의 동의 마. 동의 거부 권리 및 동의 거부에 따른 불이익 위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.
							</textarea>
						</li>
						<li class="checkBox check03">
							<ul class="clearfix">
								<li><span class="bi bi-check-lg"></span>&nbsp;
								사용자의 행동규범 및 서비스 이용제한 동의(필수)</li>
								<li class="checkBtn"><input type="checkbox" name="chk">
								</li>
							</ul> <textarea cols=110 rows=13 style="resize: none" class="form-control">
[사용자의 행동규범 및 서비스 이용제한]

① 귀하가 제공하는 정보의 내용이 허위인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 당 사이트는 귀하의 본 서비스 사용을 일부 또는 전부 중지할 수 있으며, 이로 인해 발생하는 불이익에 대해 책임을 부담하지 아니합니다.
② 귀하가 당 사이트 서비스를 통하여 게시, 전송, 입수하였거나 전자메일 기타 다른 수단에 의하여 게시, 전송 또는 입수한 모든 형태의 정보에 대하여는 귀하가 모든 책임을 부담하며 당 사이트는 어떠한 책임도 부담하지 아니합니다.
③ 당 사이트는 당 사이트가 제공한 서비스가 아닌 가입자 또는 기타 유관기관이 제공하는 서비스의 내용상의 정확성, 완전성 및 질에 대하여 보장하지 않습니다. 따라서 당 사이트는 귀하가 위 내용을 이용함으로 인하여 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 부담하지 아니합니다.
④ 귀하는 본 서비스를 통하여 다음과 같은 행동을 하지 않는데 동의합니다.
1. 타인의 아이디(ID)와 비밀번호를 도용하는 행위
2. 저속, 음란, 모욕적, 위협적이거나 타인의 프라이버시를 침해할 수 있는 내용을 전송, 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
3. 서비스를 통하여 전송된 내용의 출처를 위장하는 행위
4. 법률, 계약에 의하여 이용할 수 없는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
5. 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
6. 당 사이트의 승인을 받지 아니한 광고, 판촉물, 정크메일, 스팸, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위.
7. 다른 사용자의 개인정보를 수집 또는 저장하는 행위
8. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비를 파괴, 방해 또는 기능을 제한하기 위한 소프트웨어 바이러스를 게시, 게재 또는 전자우편으로 보내는 행위
9. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
⑤ 당 사이트는 회원이 본 약관을 위배했다고 판단되면 서비스와 관련된 모든 정보를 이용자의 동의 없이 삭제할 수 있습니다.
							</textarea>
						</li>
					</ul>
					<ul class="footBtwrap clearfix">
						<li><button class="fpmgBt1" type="reset">뒤로</button></li>
						<li><button class="fpmgBt2" type="submit">동의</button></li>
					</ul>
				</form>


			</div>
			<div class="col-2"></div>
		</div>
	</div>




	<%-- <%@ include file="../public/footer.jsp"%> --%>
	<!------------------------------ 전체 프레임 end ------------------------------>
</body>
</html>