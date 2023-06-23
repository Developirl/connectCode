	var ctx = document.getElementById('myChart6');
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '올해', '지난달','이번달' ],
			datasets : [ {
				label : '가입현황',
				data : [ Tsign_up, lastsign_up, sign_up ],
				backgroundColor : [ 
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)']

			} ]
		},
		options : {
			responsive : false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});

	var ctx = document.getElementById('myChart7');
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '올해', '지난달','이번달' ],
			datasets : [ {
				label : '탈퇴현황',
				data : [ Tquit, lastquit, quit ],
				backgroundColor : [ 
					'rgba(54, 162, 235, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(54, 162, 235, 0.2)']
			
			} ]
		},
		options : {
			responsive : false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
