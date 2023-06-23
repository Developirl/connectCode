	// 차트1(이용자수)
	var ctx = document.getElementById('myChart1');
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '누적 이용자', '일일 이용자' ],
			datasets : [ {
				label : '이용자수',
				data : [ totalVisitors, todayVisitors ],
				backgroundColor : [ 'rgba(153, 102, 255, 0.2)',
						'rgba(153, 102, 255, 0.2)' ]

			} ]
		},
		options : {
			responsive : false,
		}
	});

	// 차트2(멘토vs멘티)
	var ctx = document.getElementById('myChart2');
	var myChart = new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : [ '멘토수', '멘티수' ],
			datasets : [ {
				label : '# of Votes',
				data : [ mentors, mentees],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(255, 206, 86, 0.2)'],

			} ]
		},
		options : {
			responsive : false
		}
	});

	// 차트3 (보류vs승인)
	var ctx = document.getElementById('myChart3');
	var myChart = new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : ['보류멘토', '승인멘토'],
			datasets : [ {
				label : '이용현황',
				data : [ unreadyMentors, readyMentors],
				backgroundColor : [ 'rgba(54, 162, 235, 0.2)',
						'rgba(72, 192, 192, 0.2)']

			} ]
		},
		options : {
			responsive : false,
		}
	});
	
