// *******************************************[변수선언 start]*******************************************

// 멘토 [프로필 관리] 내비바 active 주는 css
var active = {
		"background-color": "#004EA2",
		"color": "#fff",
		"font-weight": "bold"
};

// [수정하기] 버튼 클릭 여부를 저장하는 변수
var clicked = false;

// 현재 날짜 [datepicker에 사용]
var currentDate = new Date();


// 반복문으로 출력하기 위한 배열 선언 [button/select의 value가 될것임]
// [기본정보]
var date = ['월','화','수','목','금','토','일'];
var hour = ['12','13','14','15','16','17','18'];
var min = ['00','30'];

// [인적사항]
var domain = ['직접입력','naver.com','gmail.com','daum.net','nate.com'];

// [서비스 요금]
var bank = ['','신한은행','국민은행','기업은행','농협은행','산업은행','수협은행','신협은행','우리은행','하나은행','한국씨티은행','카카오뱅크','케이뱅크','토스뱅크',
	'경남은행','광주은행','대구은행','부산은행','전북은행','제주은행','새마을은행','우체국','저축은행'];


//active 된 버튼의 value 값을 form으로 넘기기 위한 Set 객체 생성 [중복 값 없애기 위함]
var set_unable_date = new Set();
var set_mentoring_time = new Set();

// *******************************************[변수선언 end]*******************************************

// ******************************************[파일 처리 start]**********************************************
// 아래 function 호출해서 사용하기

//파일 선택
function selectFile(element) {

    const file = element.files[0];
    const filename = element.closest('.file_input').firstElementChild;
    console.log(file);
    // 1. 파일 선택 창에서 취소 버튼이 클릭된 경우
    if ( !file ) {
        filename.value = '';
        return false;
    }

    // 2. 파일 크기가 10MB를 초과하는 경우
    const fileSize = Math.floor(file.size / 1024 / 1024);
    if (fileSize > 10) {
        alert('10MB 이하의 파일로 업로드해 주세요.');
        filename.value = '';
        element.value = '';
        return false;
    }

    // 3. 파일명 지정
//    filename.value = file.name;
}


// 파일 추가
function addFile() {
    const fileDiv = document.createElement('div');
    fileDiv.innerHTML =`
        <div class="file_input" style="margin-bottom: 10px;">
           <input type="file" name="files" onchange="selectFile(this);" />
	       <button type="button" class="small_jh btn_jh add_btn" style="margin: 0px;" onclick="removeFile(this);"><span>삭제</span></button>
        </div>
    `;
    document.querySelector('.file_list').appendChild(fileDiv);
}


// 파일 삭제
function removeFile(element) {
    const fileAddBtn = element.nextElementSibling;
    if (fileAddBtn) {
        const inputs = element.previousElementSibling.querySelectorAll('input');
        inputs.forEach(input => input.value = '')
        return false;
    }
    element.parentElement.remove();
}

// ******************************************[파일 처리 end]**********************************************
// ******************************************[기본정보 start]**********************************************

// 내비바의 [기본정보] 클릭 시
function basicInfo_load(check, mentor_no, unable_date, mentoring_time) {

// 버튼 관련 함수 정의 start [함수 총 3개] ********************************************************
	
	// 버튼 출력하는 함수
	function basicInfo_btn() {
		
		//[상담 불가능한 요일] 버튼 출력
		for (var i = 0; i < date.length; i++) {
			var input = $('<input>').attr({
				type : 'button',
				class : 'unable_date btn_jh',
				name : 'unable_date',
				value : date[i],
			});
			$('#date').append(input);
		}
		
		// [상담 가능한 시간] 버튼 출력
		for (var i = 0; i < hour.length; i++) {
			for(var j = 0; j < min.length; j++){
				if(hour[i]+':'+min[j] != '18:30'){
					var input = $('<input>').attr({
						type : 'button',
						class : 'mentoring_time btn_jh',
						name : 'mentoring_time',
						value : hour[i]+':'+min[j],
					});
				}
				$('#time').append(input);
			}
		}
		
	}

	// 버튼 active 효과 주는 함수 [form으로 넘길때 active 클래스를 가지는 버튼의 value만 넘어가므로]
	function basicInfo_btn_css(){
		
		// [상담 불가능한 요일] 버튼 클릭 시 css 효과 + set 객체 삭제/저장
		$('.unable_date').click(function(){
			if ($(this).hasClass('active')) { // 이미 active 클래스가 있는 경우 (두 번 클릭시)
				$(this).removeClass('active');  // active 클래스 제거 (배경색 없앰)
				set_unable_date.delete($(this).val()); // set 객체에서 삭제
				
			} else {					  // active 클래스가 없는 경우 (처음 클릭시)
				$(this).addClass('active'); // 클릭된 버튼에 active 클래스 추가 (배경색 넣기)
				set_unable_date.add($(this).val()); // set 객체에 저장
			}
		});
		
		
		// [상담 가능한 시간] 버튼 클릭 시 css 효과
		$('.mentoring_time').click(function(){
			if ($(this).hasClass('active')) { // 이미 active 클래스가 있는 경우 (두 번 클릭시)
				$(this).removeClass('active');  // active 클래스 제거 (배경색 없앰)
				set_mentoring_time.delete($(this).val()); // set 객체에서 삭제
				
			} else {					  // active 클래스가 없는 경우 (처음 클릭시)
				$(this).addClass('active'); // 클릭된 버튼에 active 클래스 추가 (배경색 넣기)
				set_mentoring_time.add($(this).val()); // set 객체에 저장
			}
			
		});
		
	} // basicInfo_btn_css() end
	
	// DB에 저장된 데이터를 value로 가지고 있는 버튼만 active 효과 주기 [입력 값 DB에 저장한 다음 저장된 값 보여주는 View에서 사용]
	function actived_btn(){
		
		basicInfo_btn();
		
		// 모든 [상담 불가능한 요일] 버튼의 value 값을 배열에 저장 (DB에 저장된 값이랑 비교할때 사용)
		var date_values = $('.unable_date').map(function(){
			return $(this).val();
		}).get();
		
		// 모든 [상담 가능한 시간] 버튼의 value 값을 배열에 저장 (DB에 저장된 값이랑 비교할때 사용)
		var time_values = $('.mentoring_time').map(function(){
			return $(this).val();
		}).get();
		
		// DB에 저장된 값(문자열) 불러와서 구분기호(,) 기준으로 자르고 배열에 저장
		if (!(Array.isArray(unable_date) && Array.isArray(mentoring_time))) {
			var arr_unable_date = unable_date.split(',');
			var arr_mentoring_time = mentoring_time.split(',');
		}else {
			var arr_unable_date = unable_date;
			var arr_mentoring_time = mentoring_time;
		}
		
		// 반복문 돌면서 버튼의 value 값이랑 DB에 저장된 값이랑 비교 + 두개의 값 동일하면 active CSS 효과 넣어줌
		// [상담 불가능한 요일] 버튼
		for(var i=0; i<arr_unable_date.length; i++){
			if(date_values.includes(arr_unable_date[i])){
				$('.unable_date[value="'+arr_unable_date[i]+'"]').addClass('active');
				/*set_unable_date.add($('.unable_date .active').val());*/
			}
		}
		// [상담 가능한 시간] 버튼
		for(var i=0; i<arr_mentoring_time.length; i++){
			if(time_values.includes(arr_mentoring_time[i])){
				$('.mentoring_time[value="'+arr_mentoring_time[i]+'"]').addClass('active');
				/*set_mentoring_time.add($('.mentoring_time .active').val());*/
			}
		}
		
	} // actived_btn() end
	
// 버튼 관련 함수 정의 end ********************************************************

	
// 지금부터 ajax로 페이지 전환 간드아아아아!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	console.log(check);
	
// msel.intro 가 빈문자열 혹은 [수정하기] 버튼을 클릭한 경우
	if(check == '' || check == null || check == true) {
		
	// <div id=load_location>에 [기본정보] page 불러오는 ajax
		$.ajax({
			url: 'mentorBasicInfoPage',	// 작성 전 페이지 = 수정 페이지
			method: 'GET',
			data: {mentor_no : mentor_no},
			success: function(data) {
				$('#load_location').empty().html(data);
				$('#load_location, .nav_items').removeAttr('style');
				$('.basicInfo').css(active);
				$("span:contains('[필수]')").css('color', 'red');
				$("span:contains('[선택]')").css('color', '#004EA2');
				
				// [프로필 사진] 첨부 파일 미리보기
				$('#files').on('change input', function(event) {
					
					var file = event.target.files[0];
					
					if(file !== undefined){
						var reader = new FileReader(); 
						reader.onload = function(e) {
							$('#preview').attr('src', e.target.result);
						};
						reader.readAsDataURL(file);
					} else {
						$('#preview').attr('src', '/public/img/profile_img.png');
					}
					
				});
				
				// 파일 처리
				//selectFile(element);
				
				// [상담 불가능한 요일] & [상담 가능한 시간] 버튼 처리하는 부분 !!!!!!
				
				basicInfo_btn(); 		// 버튼 출력하는 함수 호출
				basicInfo_btn_css();	// 버튼에 active 클래스 있으면 css 주고 set 객체에 저장
				
				// active 된 버튼만 form으로 전송 [앞서 선언해둔 set객체 사용]
				$('#myform').submit(function(event){
					event.preventDefault(); // form 기본 동작 막기
					
					// set 객체에 저장된 값 배열로 변환해서 변수에 할당
					var unable_date = Array.from(set_unable_date);
					var mentoring_time = Array.from(set_mentoring_time);
					
				// 유효성 검사 start
					// 소개글
					var intro = $('#intro').val();
					if (intro.trim() === '') {
						alert('소개글을 입력하세요.');
						$('#intro').focus();
						return;
					}
					// 상담 불가능 요일
					if(unable_date.length < 1) {
						if (confirm('상담이 불가능한 [요일]을 선택하지 않았습니다.\n모든 요일에 상담이 가능하십니까?')) {
							
						} else {
							return;
						}
					}
					// 상담 가능 시간
					if(mentoring_time.length < 1) {
						alert('상담이 가능한 [시간]을 선택하지 않았습니다.\n1개 이상 선택해주세요.');
						return;
					}
				// 유효성 검사 end
					
					/*// hidden value에 mentor_no 정의
					var mentor_no_hidden = $('<input>').attr({
						type : 'hidden',
						name : 'mentor_no',
						value : mentor_no
					});*/
					
					// hidden value에 var unable_date_values [배열] 정의
					var unable_date_hidden = $('<input>').attr({
						type : 'hidden',
						name : 'unable_date',
						value : unable_date
					});
					
					// hidden value에 var mentoring_time_values [배열] 정의
					var mentoring_time_hidden = $('<input>').attr({
						type : 'hidden',
						name : 'mentoring_time',
						value : mentoring_time
					});
					
					// 설정한 값으로 hidden 생성
					$('#myform').append(unable_date_hidden,mentoring_time_hidden);
					
					var form = $('#myform')[0];
					var formdata = new FormData(form);
					
					$.ajax({
						url : $(this).attr('action'),
						type : 'POST',
						data : formdata,
						processData : false,
						contentType : false,
						enctype : 'multipart/form-data',
						success: function(){
							// 입력 완료 후 페이지 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
							basicInfo_load(intro, mentor_no, unable_date, mentoring_time);
							
							// [상담 불가능한 요일] & [상담 가능한 시간] 버튼 처리하는 부분 !!!!!!
							actived_btn();
							$('.unable_date').css({'cursor' : 'auto'});
							$('.mentoring_time').css({'cursor' : 'auto'});
							
							// [수정하기] 버튼 클릭 이벤트
							$('#edit_btn').click(function() {
							      clicked = true; 			// 버튼이 클릭되면 변수 값을 true로 변경
							      
							      // 수정 페이지로 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
							      basicInfo_load(clicked, mentor_no, unable_date, mentoring_time);	
							      
							});  // [수정하기] 클릭 이벤트 end
							
							if(check == '' || check == null) {
								// progress 올리기
								var currentValue = parseInt($('#progress').val());
								var updatedValue = currentValue + 25;
								$('#progress').val(updatedValue);
							}
							
						},
						error : function(){
							alert("서버 오류");
						}
					});
					
					/*// form 통해서 전송할 데이터 직렬화
					$.post($(this).attr('action'), $(this).serialize(), function(response) {
						
						// 입력 완료 후 페이지 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
						basicInfo_load(intro, mentor_no, unable_date, mentoring_time);
						
						// [상담 불가능한 요일] & [상담 가능한 시간] 버튼 처리하는 부분 !!!!!!
						actived_btn();
						$('.unable_date').css({'cursor' : 'auto'});
						$('.mentoring_time').css({'cursor' : 'auto'});
						
						// [수정하기] 버튼 클릭 이벤트
						$('#edit_btn').click(function() {
						      clicked = true; 			// 버튼이 클릭되면 변수 값을 true로 변경
						      
						      // 수정 페이지로 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
						      basicInfo_load(clicked, mentor_no, unable_date, mentoring_time);	
						      
						});  // [수정하기] 클릭 이벤트 end
						
						if(check == '' || check == null) {
							// progress 올리기
							var currentValue = parseInt($('#progress').val());
							var updatedValue = currentValue + 25;
							$('#progress').val(updatedValue);
						}
						
					});*/
					
				}); // submit end
				
			} // [mentorBasicInfoPage] ajax-success end ******************************************* 추가 start *******************************************
		
		}); // [mentorBasicInfoPage] ajax end ******************************************* 추가 end *******************************************
		
	}else { // if end, else start
		
// msel.intro 에 데이터가 있는 경우
		$.ajax({
			url: 'mentorBasicInfoPage_View',  // 입력 완료 페이지
			method: 'GET',
			data: {mentor_no : mentor_no},
			success: function(data) {
				$('#load_location').empty().html(data);
				$('#load_location, .nav_items').removeAttr('style');
				$('.basicInfo').css(active);
	
				// [상담 불가능한 요일] & [상담 가능한 시간] 버튼 처리하는 부분 !!!!!!
				actived_btn();
				$('.unable_date').css({'cursor' : 'auto'});
				$('.mentoring_time').css({'cursor' : 'auto'});
				
				// [수정하기] 버튼 클릭 이벤트
			    $('#edit_btn').click(function() {
			      clicked = true; 			// 버튼이 클릭되면 변수 값을 true로 변경
			      
			      // 수정 페이지로 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
			      basicInfo_load(clicked, mentor_no, unable_date, mentoring_time);	
			      
			    }); // [수정하기] 클릭 이벤트 end
			    
			} // [mentorBasicInfoPage_View] ajax-success end ******************************************* 추가 start *******************************************
		
		}); // [mentorBasicInfoPage_View] ajax end ******************************************* 추가 end *******************************************
		
	} // else end
			
} // basicInfo_load() end

// ******************************************[기본정보 end]**********************************************
// ******************************************[인적사항 start]**********************************************

// 내비바의 [인적사항] 클릭 시
function personInfo_load(mentor_no, old_phone, old_email) {
	
	$.ajax({
		url: 'mentorPersonInfoPage_View',  // 입력 완료 페이지
		data: {mentor_no : mentor_no},
		method: 'GET',
		success: function(data) {
			$('#load_location').empty().append(data);
			$('#load_location, .nav_items').removeAttr('style');
			$('.personInfo').css(active);
			
			// 전화번호에 구분기호(-) 넣어서 화면단으로 출력
			var formattedPhoneNumber = old_phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
			$('#phoneNumber').append(formattedPhoneNumber);
			
			// 수정하기 버튼 클릭시
			$('#edit_btn').click(function(){
				$.ajax({
					url: 'mentorPersonInfoPage',  // 수정 페이지
					data: {mentor_no : mentor_no},
					method: 'GET',
					success: function(data) {
						$('#load_location').empty().append(data);
						$('#load_location, .nav_items').removeAttr('style');
						$('.personInfo').css(active);
						$("span:contains('[선택]')").css('color', '#004EA2');
						
						// [도메인] select option
						for (var i = 0; i < domain.length; i++) {
							var option = $('<option>').attr({
								value : domain[i]
							}).text(domain[i]); // 값 설정
							$('#domain_sel').append(option);
						}
						
						$('#myform').submit(function(event){
							event.preventDefault(); // form 기본 동작 막기
							
						// 유효성 검사 start
							var new_phone = $('#phone').val();
							var new_email = $('#email_id').val() + '@' + $('#domain').val();
							
							if(new_phone === old_phone){
								if (confirm('기존의 휴대폰번호와 동일한 번호로 저장합니다.')) {

								} else {
									alert('휴대폰 번호를 입력한 후 [인증하기] 버튼을 클릭하여 인증 후,\n[저장하기] 버튼을 클릭해주세요.')
									$('#phone').focus();
								    return;
								}
							}
								
							if(new_email === old_email){
								if(confirm('기존의 이메일과 동일한 이메일로 저장합니다.')) {

								} else {
									alert('변경할 메일 주소를 입력해주세요.')
									$('#email_id').focus();
								    return;
								}
							}
							
						// 유효성 검사 end
							
							// hidden value에 var new_email 정의
							var email_hidden = $('<input>').attr({
								type : 'hidden',
								name : 'email',
								value : new_email
							});
							
							// 설정한 값으로 hidden 생성
							$('#myform').append(email_hidden);
							
							// form 통해서 전송할 데이터 직렬화
							$.post($(this).attr('action'), $(this).serialize(), function(response) {

								personInfo_load(mentor_no, new_phone, new_email);
							
							}); 
							
						}); // submit end
						
					}
				});
			});
			
		} // personInfo_load() ajax-success end

	}); // personInfo_load() ajax end
	
			
} // personInfo_load() end

// ******************************************[인적사항 end]**********************************************
// ******************************************[서비스요금 start]**********************************************

// ******************************************* 추가 start *******************************************
// 서비스요금 page 불러오기
function serviceChar_load(check,mentor_no) {
	
// 지금부터 ajax로 페이지 전환 간드아아아아!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	console.log(check);
	
// msel.account 가 빈문자열 혹은 [수정하기] 버튼을 클릭한 경우
	if(check == '' || check == null || check == true) {
	
		$.ajax({
			url: 'mentorServiceCharPage',  // JSP 파일의 URL
			method: 'GET',
			data: {mentor_no : mentor_no},
			success: function(data) {
				$('#load_location').empty().append(data);
				$('#load_location, .nav_items').removeAttr('style');
				$('.serviceChar').css(active);
				$("span:contains('[필수]')").css('color', 'red');
				$("span:contains('[선택]')").css('color', '#004EA2');
				
				// [은행명] select option
				for (var i = 0; i < bank.length; i++) {
					if(bank[i] == ''){
						var option = $('<option>').attr({
							value : ''
						}).text('선택'); // 값 설정
					}else {
						var option = $('<option>').attr({
							value : bank[i]
						}).text(bank[i]); // 값 설정
					}
					$('#bank').append(option);
				}
				
				// [상담 종류 :: 전화상담] 체크박스 체크되면 value='Y'로 하고, [전화 상담 요금] input text 활성
				$('#call_mentoring').change(function() {
					if ($(this).is(':checked')) {
						$(this).val('Y'); // value를 'on' 말고 'Y'로 바꿈
						$('#call_mentoring_fee').removeAttr('readonly');
					} else {
					   $('#call_mentoring_fee').prop('readonly', true);
					}
				});
				
				// [상담 종류 :: 대면상담] 체크박스 체크되면 value='Y'로 하고, [대면 상담 요금] input text 활성
				$('#meet_mentoring').change(function() {
					if ($(this).is(':checked')) {
						$(this).val('Y'); // value를 'on' 말고 'Y'로 바꿈
						$('#meet_mentoring_fee').removeAttr('readonly');
					} else {
						$('#meet_mentoring_fee').prop('readonly', true);
					}
				});
				
				$('#myform').submit(function(event){
					event.preventDefault(); // form 기본 동작 막기
					
				// 유효성 검사 start
					var mentoring_kind_checked = $('input[type=checkbox]:checked');
					
					var call_mentoring_checked = $('#call_mentoring').is(':checked');
					var meet_mentoring_checked = $('#meet_mentoring').is(':checked');
					
					if(mentoring_kind_checked.length < 1) {
						alert('이용하실 상담 종류를 1개 이상 체크하세요.');
						return;
					}
					
					if(call_mentoring_checked) {
						if($('#call_mentoring_fee').val() === '') {
							alert('[전화]상담의 요금을 입력하세요.');
							$('#call_mentoring_fee').focus();
							return;
						}
					}
					if(meet_mentoring_checked) {
						if($('#meet_mentoring_fee').val() === '') {
							alert('[대면]상담의 요금을 입력하세요.');
							$('#meet_mentoring_fee').focus();
							return;
						}
					}
					
					// 은행명
					var bank = $('#bank').val();
					if (bank.trim() === '') {
						alert('은행을 선택하세요.');
						$('#bank').focus();
						return;
					}
					// 계좌번호
					var account = $('#account').val();
					if (account.trim() === '') {
						alert('계좌번호를 입력하세요.');
						$('#account').focus();
						return;
					}
					// 예금주
					var account_name = $('#account_name').val();
					if (account_name.trim() === '') {
						alert('예금주명을 입력하세요.');
						$('#account_name').focus();
						return;
					}
				// 유효성 검사 end
					
					// [상담 종류] 체크박스 체크 안된 경우 value="N"으로 바꿔서 보냄
					if (!$('#call_mentoring').is(':checked')) {
						$(this).append('<input type="hidden" name="call_mentoring" value="N">');
					}
					
					if (!$('#meet_mentoring').is(':checked')) {
						$(this).append('<input type="hidden" name="meet_mentoring" value="N">');
					}
					
					// form 통해서 전송할 데이터 직렬화
					$.post($(this).attr('action'), $(this).serialize(), function(response) {
					
						// 입력 완료 후 페이지 전환 (serviceChar_load()에 매개변수 새로 넣어서 재호출)
						serviceChar_load(account);
						
						// [수정하기] 버튼 클릭 이벤트
						$('#edit_btn').click(function() {
						      clicked = true; 			// 버튼이 클릭되면 변수 값을 true로 변경
						      
						      // 수정 페이지로 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
						      serviceChar_load(clicked,mentor_no);	
						      
						});  // [수정하기] 클릭 이벤트 end
						
						if(check == '' || check == null) {
							// progress 올리기
							var currentValue = parseInt($('#progress').val());
							var updatedValue = currentValue + 25;
							$('#progress').val(updatedValue);
						}
						
					});
				}); // submit end
				
			} // [mentorServiceCharPage] ajax-success end
		}); // [mentorServiceCharPage] ajax end
		
	}else { // if end, else start
		
		// msel.intro 에 데이터가 있는 경우
				$.ajax({
					url: 'mentorServiceCharPage_View',  // 입력 완료 페이지
					method: 'GET',
					data: {mentor_no : mentor_no},
					success: function(data) {
						$('#load_location').empty().html(data);
						$('#load_location, .nav_items').removeAttr('style');
						$('.serviceChar').css(active);
			
						// [수정하기] 버튼 클릭 이벤트
					    $('#edit_btn').click(function() {
					      clicked = true; 			// 버튼이 클릭되면 변수 값을 true로 변경
					      
					      // 수정 페이지로 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
					      serviceChar_load(clicked,mentor_no);	
					      
					    }); // [수정하기] 클릭 이벤트 end
					    
					} // [mentorServiceCharPage_View] ajax-success end
				
				}); // [mentorServiceCharPage_View] ajax end
				
			} // else end		
		
		
} // serviceChar_load() end

// ******************************************* 추가 end *******************************************

// ******************************************[서비스요금 end]**********************************************
// ******************************************[학력사항 start]**********************************************

// 학력사항 page 불러오기
function eduInfo_load(check,mentor_no) {
	
	var degree = ['','학사','석사','박사'];
	
	console.log(check);
	
	if(check === 0 || check == true) {
		
		$.ajax({
			url: 'mentorEduInfoPage',  // JSP 파일의 URL
			method: 'GET',
			data: {mentor_no : mentor_no},
			success: function(data) {
				$('#load_location').empty().append(data);
				$('#load_location, .nav_items').removeAttr('style');
				$('.eduInfo').css(active);
				$("span:contains('[필수]')").css('color', 'red');
				$("span:contains('[선택]')").css('color', '#004EA2');
				
				// [학위] select option
				for (var i = 0; i < degree.length; i++) {
					if(degree[i] == ''){
						var option = $('<option>').attr({
							value : 'N'
						}).text('선택'); // 값 설정
					}else {
						var option = $('<option>').attr({
							value : degree[i]
						}).text(degree[i]); // 값 설정
					}
					$('#degree').append(option);
				}
				
				// Air-datePicker 호출
				$(".datepicker-here").datepicker({maxDate : currentDate}); 
				
				// 추가,삭제 버튼 구현 start
				
				// [추가하기] 버튼 클릭시 추가될 요소 가져오기
				var plus_content_read = $('#plus_content').html();
				
				// [추가하기] 버튼 클릭해서 추가된 요소 갯수 카운팅
				var plus_div_cnt = $(".plus_div").length;
				
				// [삭제하기] 버튼의 id 고유번호 저장할 변수 선언
				var del_cnt = '';
				
				del_cnt = plus_div_cnt; 
				
				// [추가하기] 버튼 클릭 이벤트
				$('.plus_btn').click(function(){
					
					$('#plus_content').append('<div id="del_div'
										+	del_cnt
										+	'"><hr class="title_hr">'
										+	plus_content_read
										+	'<div align="right" style="margin-top: 10px;">'
										+	'<button type="button" class="small_jh btn_jh" id="del_btn' 
										+	del_cnt+'"'
										+	' style="background-color: red; color: #fff;" onClick="delete_btn('+del_cnt+');">삭제하기</button></div></div>'
									);
					
					// id 값이 minor0인 요소의 id값 수정 [기존건 minor0, 이후 새로 생성된 minor부터는 1부터 매겨짐]
					var new_id = 'minor' + del_cnt;
					$('#minor0').attr('id', new_id);
					
					// id 값에 minor를 포함하는 input text 찾기
					var minorTextInputs = $('input[type="text"]').filter(function() {
						return $(this).attr('id') && $(this).attr('id').indexOf('minor') !== -1;
					});
					
					// 찾은 input text의 갯수 구하기
					var count = minorTextInputs.length;
					console.log('minorTextInputs count:::'+count);
					
					// 갯수만큼 루프돌리면서, hidden으로 minor 값 전달 [minor1 부터만 처리(minor0은 click 이벤트 밖에서 처리..)]
					for(var i=1; i<count; i++) {
						if ($('#minor'+i).val() == '') {
							$('#myform').append('<input type="hidden" name="minor" value="N">');
						}else {
							$('#myform').append('<input type="hidden" name="minor" value="'+$('#minor'+i).val()+'">');
						}
					}
					
					del_cnt++;
					
					console.log(del_cnt);
					
					// Air-datePicker 호출 따로 또 해줘야함..
					$(".datepicker-here").datepicker({maxDate : currentDate}); 
					
				});
				
				$('#myform').submit(function(){
					event.preventDefault(); // form 기본 동작 막기
					
				 // 유효성 검사 start
						// 소개글
						var school = $('#school').val();
						if (school.trim() === '') {
							alert('학교명을 입력하세요.');
							$('#school').focus();
							return;
						}
						// 입학일자
						var entering_date = $('#entering_date').val();
						if (entering_date.trim() === '') {
							alert('입학일자를 선택하세요.');
							$('#entering_date').focus();
							return;
						}
						// 졸업일자
						var graduation_date = $('#graduation_date').val();
						if (graduation_date.trim() === '') {
							alert('졸업일자를 선택하세요.');
							$('#graduation_date').focus();
							return;
						}
						/*// 학위
						var degree_checked = $('#meet_mentoring').is(':selected');
						if(!degree_checked) {
							alert('학위를 선택하세요.');
							return;
						}*/
						// 전공명
						var major = $('#major').val();
						if (major.trim() === '') {
							alert('전공명을 입력하세요.');
							$('#major').focus();
							return;
						}
				// 유효성 검사 end
						
				        // minor0 value 값 전달
						// click 이벤트 밖에 정의해야함
						var minor = $('#minor0').val();
						
						if (minor === '') {
							$('#myform').append('<input type="hidden" name="minor" value="N">');
						}else {
							$('#myform').append('<input type="hidden" name="minor" value="'+minor+'">');
						}
						
						// form으로 데이터 전송 start
						var form = $('#myform')[0];
						var formdata = new FormData(form);
						
						$.ajax({
							url : $(this).attr('action'),
							type : 'POST',
							data : formdata,
							processData : false,
							contentType : false,
							enctype : 'multipart/form-data',
							success: function(){
								// 입력 완료 후 페이지 전환 (eduInfo_load()에 매개변수 새로 넣어서 재호출)
								eduInfo_load(school,mentor_no);
								
								if(check == 0) {
									// progress 올리기
									var currentValue = parseInt($('#progress').val());
									var updatedValue = currentValue + 25;
									$('#progress').val(updatedValue);
								}
							},
							error : function(){
								alert("서버 오류");
							}
						});
						
				}); // submit end
			
				
			} // eduInfo_load() ajax-success end
		}); // eduInfo_load() ajax end
	
	}else { // if end else start
		
		$.ajax({
			url: 'mentorEduInfoPage_View',  // JSP 파일의 URL
			method: 'GET',
			data: {mentor_no : mentor_no},
			success: function(data) {
				$('#load_location').empty().append(data);
				$('#load_location, .nav_items').removeAttr('style');
				$('.eduInfo').css(active);
				
				// [수정하기] 버튼 클릭 이벤트
			    $('#edit_btn').click(function() {
			      clicked = true; 			// 버튼이 클릭되면 변수 값을 true로 변경
			      
			      // 수정 페이지로 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
			      eduInfo_load(clicked,mentor_no);	
			      
			    }); // [수정하기] 클릭 이벤트 end
			    
			} // [mentorEduInfoPage_View] ajax-success end
				
		}); // [mentorEduInfoPage_View] ajax end
		
	} // else end
	
} // eduInfo_load() end

// ******************************************[학력사항 end]**********************************************
// ******************************************[경력사항 start]**********************************************

// 경력사항 page 불러오기
function expInfo_load(check,mentor_no) {
	
	var task = ['','프론트엔드','백엔드'];
	
	console.log(check);
	
	if(check === 0 || check == true) {
		
		$.ajax({
			url: 'mentorExpInfoPage',  // JSP 파일의 URL
			method: 'GET',
			data: {mentor_no : mentor_no},
			success: function(data) {
				$('#load_location').empty().append(data);
				$('#load_location, .nav_items').removeAttr('style');
				$('.expInfo').css(active);
				$("span:contains('[필수]')").css('color', 'red');
				$("span:contains('[선택]')").css('color', '#004EA2');
				
				// [직무] select option
				for (var i = 0; i < task.length; i++) {
					if(task[i] == ''){
						var option = $('<option>').attr({
							value : ''
						}).text('선택'); // 값 설정
					}else {
						var option = $('<option>').attr({
							value : task[i]
						}).text(task[i]); // 값 설정
					}
					$('#task').append(option);
				}
				
				// Air-datePicker 호출
				$(".datepicker-here").datepicker({maxDate : currentDate}); 
				
				
				// 추가,삭제 버튼 구현 start
				
				// [추가하기] 버튼 클릭시 추가될 요소 가져오기
				var plus_content_read = $('#plus_content').html();
	
				// [추가하기] 버튼 클릭해서 추가된 요소 갯수 카운팅
				var plus_div_cnt = $(".plus_div").length;
				
				// [삭제하기] 버튼의 id 고유번호 저장할 변수 선언
				var del_cnt = '';
				
				del_cnt = plus_div_cnt; 
				
				// [추가하기] 버튼 클릭 이벤트
				$('.plus_btn').click(function(){
					
					$('#plus_content').append('<div id="del_div'
										+	del_cnt
										+	'"><hr class="title_hr">'
										+	plus_content_read
										+	'<div align="right" style="margin-top: 10px;">'
										+	'<button type="button" class="small_jh btn_jh" id="del_btn' 
										+	del_cnt+'"'
										+	' style="background-color: red; color: #fff;" onClick="delete_btn('+del_cnt+');">삭제하기</button></div></div>'
									);
					
					del_cnt++;
					
					// Air-datePicker 호출 따로 또 해줘야함..
					$(".datepicker-here").datepicker({maxDate : currentDate}); 
				});
				
				$('#myform').submit(function(){
					event.preventDefault(); // form 기본 동작 막기
					
				 // 유효성 검사 start
						// 회사명
						var company = $('#company').val();
						if (company.trim() === '') {
							alert('회사명을 입력하세요.');
							$('#company').focus();
							return;
						}
						// 입사일자
						var entering_date = $('#entering_date').val();
						if (entering_date.trim() === '') {
							alert('입사일자를 선택하세요.');
							$('#entering_date').focus();
							return;
						}
						/*// 직무
						var task_checked = $('#task').is(':selected');
						if(!task_checked) {
							alert('직무를 선택하세요.');
							return;
						}*/
				// 유효성 검사 end

						// form으로 데이터 전송 start
						var form = $('#myform')[0];
						var formdata = new FormData(form);
						
						$.ajax({
							url : $(this).attr('action'),
							type : 'POST',
							data : formdata,
							processData : false,
							contentType : false,
							enctype : 'multipart/form-data',
							success: function(){
								// 입력 완료 후 페이지 전환 (eduInfo_load()에 매개변수 새로 넣어서 재호출)
								expInfo_load(company,mentor_no);
								
								if(check == 0) {
									// progress 올리기
									var currentValue = parseInt($('#progress').val());
									var updatedValue = currentValue + 25;
									$('#progress').val(updatedValue);
								}
							},
							error : function(){
								alert("서버 오류");
							}
						});
						
				}); // submit end
				
			} // expInfo_load() ajax-success end
		}); // expInfo_load() ajax end
	
	}else { // if end, else start
		
		$.ajax({
			url: 'mentorExpInfoPage_View',  // JSP 파일의 URL
			method: 'GET',
			data: {mentor_no : mentor_no},
			success: function(data) {
				$('#load_location').empty().append(data);
				$('#load_location, .nav_items').removeAttr('style');
				$('.expInfo').css(active);
				
				// [수정하기] 버튼 클릭 이벤트
			    $('#edit_btn').click(function() {
			      clicked = true; 			// 버튼이 클릭되면 변수 값을 true로 변경
			      
			      // 수정 페이지로 전환 (basicInfo_load()에 매개변수 새로 넣어서 재호출)
			      expInfo_load(clicked,mentor_no);	
			      
			    }); // [수정하기] 클릭 이벤트 end
			    
			} // [mentorEduInfoPage_View] ajax-success end
				
		}); // [mentorEduInfoPage_View] ajax end
		
	} // else end
	
} // expInfo_load() end

// ******************************************[경력사항 end]**********************************************
// ******************************************[기술및분야 start]**********************************************

// 기술및분야 page 불러오기
function techInfo_load() {
	
	var technology = ['', 'Java', 'Python', 'JavaScript', 'C#', 'C++', 'Ruby', 'PHP', 'Swift', 'Go', 'Kotlin',
            'HTML/CSS', 'React', 'Angular', 'Vue.js', 'Node.js', 'Express.js', 'Django', 'Flask', 'ASP.NET',
            'Spring', 'Spring Boot', 'MySQL', 'PostgreSQL', 'Oracle', 'MongoDB', 'Redis', 'SQLite', 'AWS', 'Azure',
            'Google Cloud Platform', 'Docker', 'Kubernetes', 'Git', 'SVN', 'Jenkins', 'Jira', 'Agile/Scrum',
            'RESTful API', 'GraphQL'];
	
	var kind = ['','자격증','면허증','수상내역/공모전'];
	
	technology.sort(); // 오름차순 정렬
	
	$.ajax({
		url: 'mentorTechInfoPage',  // JSP 파일의 URL
		method: 'GET',
		success: function(data) {
			$('#load_location').empty().append(data);
			$('#load_location, .nav_items').removeAttr('style');
			$('.techInfo').css(active);
			$("span:contains('[필수]')").css('color', 'red');
			$("span:contains('[선택]')").css('color', '#004EA2');
			
			// [보유기술] select option
			for (var i = 0; i < technology.length; i++) {
				if(technology[i] == ''){
					var option = $('<option>').attr({
						value : ''
					}).text('선택'); // 값 설정
				}else {
					var option = $('<option>').attr({
						value : technology[i]
					}).text(technology[i]); // 값 설정
				}
				$('#technology').append(option);
			}
			
			// [자격증명] select option
			for (var i = 0; i < kind.length; i++) {
				if(kind[i] == ''){
					var option = $('<option>').attr({
						value : ''
					}).text('선택'); // 값 설정
				}else {
					var option = $('<option>').attr({
						value : kind[i]
					}).text(kind[i]); // 값 설정
				}
				$('#kind').append(option);
			}
			
			// Air-datePicker 호출
			$(".datepicker-here").datepicker({maxDate : currentDate}); 
			
			
			// 추가,삭제 버튼 구현 start
			
			// [추가하기] 버튼 클릭시 추가될 요소 가져오기
			var plusTech_content_read = $('#plusTech_content').html();
			var plusLice_content_read = $('#plusLice_content').html();

			// [추가하기] 버튼 클릭해서 추가된 요소 갯수 카운팅
			var plus_div_cnt = $(".plus_div").length;
			
			// [삭제하기] 버튼의 id 고유번호 저장할 변수 선언
			var del_cnt = '';
			
			del_cnt = plus_div_cnt; 
			
			// 보유기술 [추가하기] 버튼 클릭 이벤트
			$('.plusTech_btn').click(function(){
				
				$('#plusTech_content').append('<div id="del_div' 
						+	del_cnt
						+	'" style="margin-top: 10px;">'
						+	plusTech_content_read
						+	'<div align="right" style="margin-top: 10px;">'
						+	'<button type="button" class="small_jh btn_jh" id="del_btn' 
						+	del_cnt+'"'
						+	' style="background-color: red; color: #fff;" onClick="delete_btn('+del_cnt+');">삭제하기</button></div></div>'
				);
					
				
				del_cnt++;
				
				// Air-datePicker 호출 따로 또 해줘야함..
				$(".datepicker-here").datepicker({maxDate : currentDate}); 
			});
			
			// 자격증/수상내역 [추가하기] 버튼 클릭 이벤트
			$('.plusLice_btn').click(function(){
				
				$('#plusLice_content').append('<div id="del_div' 
						+	del_cnt
						+	'"><hr class="title_hr">'
						+	plusLice_content_read
						+	'<div align="right" style="margin-top: 10px;">'
						+	'<button type="button" class="small_jh btn_jh" id="del_btn' 
						+	del_cnt+'"'
						+	' style="background-color: red; color: #fff;" onClick="delete_btn('+del_cnt+');">삭제하기</button></div></div>'
				);
				
				
				del_cnt++;
				
				// Air-datePicker 호출 따로 또 해줘야함..
				$(".datepicker-here").datepicker({maxDate : currentDate}); 
			});
			
			
		} // techInfo_load() ajax-success end
	}); // techInfo_load() ajax end
} // techInfo_load() end

// ******************************************[기술및분야 end]**********************************************
