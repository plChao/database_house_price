$(document).ready(function(){
	$.ajax({
		url : "http://localhost/graph/line_data.php",
		type : "GET",
		success : function(data){
			var datajson = JSON.parse(data);
			console.log(data);

			var district = [];
			var price = [];

			for(var i in datajson) {
				district.push(datajson[i].district);
				price.push(datajson[i].price);
			}

			var chartdata = {
				labels: district,
				datasets: [
					{
						label: "District Price",
						fill: false,
						lineTension: 0.1,
						backgroundColor: "rgba(59, 89, 152, 0.75)",
						borderColor: "rgba(59, 89, 152, 1)",
						pointHoverBackgroundColor: "rgba(59, 89, 152, 1)",
						pointHoverBorderColor: "rgba(59, 89, 152, 1)",
						data: price
					},
					/*{
						label: "twitter",
						fill: false,
						lineTension: 0.1,
						backgroundColor: "rgba(29, 202, 255, 0.75)",
						borderColor: "rgba(29, 202, 255, 1)",
						pointHoverBackgroundColor: "rgba(29, 202, 255, 1)",
						pointHoverBorderColor: "rgba(29, 202, 255, 1)",
						data: twitter_follower
					},
					{
						label: "googleplus",
						fill: false,
						lineTension: 0.1,
						backgroundColor: "rgba(211, 72, 54, 0.75)",
						borderColor: "rgba(211, 72, 54, 1)",
						pointHoverBackgroundColor: "rgba(211, 72, 54, 1)",
						pointHoverBorderColor: "rgba(211, 72, 54, 1)",
						data: googleplus_follower
					}*/
				]
			};

			var ctx = $("#linecanvas");

			var LineGraph = new Chart(ctx, {
				type: 'line',
				data: chartdata
			});
		},
		error : function(data) {

		}
	});
});
