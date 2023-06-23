	var ctx = document.getElementById('myChart4');
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '멘토 남', '멘토 여', '멘티 남', '멘티 여' ],
			datasets : [ {
				label : '성비',
				data : [ male, female, eemale, eefemale ],
				backgroundColor : [ 
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 99, 132, 0.2)']

			} ]
		},
		options : {
			responsive : false,
		}
	});

	var ctx = document.getElementById('myChart5');
	var myChart = new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : [ '전체 남성', '전체 여성'],
			datasets : [ {
				label : '이용자 전체 성비',
				data : [ tmale, tfemale],
				backgroundColor : [ 'rgba(54, 162, 235, 0.2)','rgba(255, 99, 132, 0.2)']
			
			} ]
		},
		options : {
			responsive : false,
		}
	});