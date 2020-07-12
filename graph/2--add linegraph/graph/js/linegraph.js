$(document).ready(function(){
	$.ajax({
		url : "http://localhost/graph/data2.php",
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
				]
			};

			var ctx = $("#mycanvas");

			var LineGraph = new Chart(ctx, {
				type: 'line',
				data: chartdata
			});
		},
		error : function(data) {

		}
	});
});
