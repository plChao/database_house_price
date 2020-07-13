$(document).ready(function(){
	$.ajax({
		url: "http://localhost/graph/pie_data.php",
		method: "GET",
		success: function(data) {
			var datajson = JSON.parse(data);
			console.log(data);
			var district = [];
			var count = [];
			for(var i in datajson) {
				district.push(datajson[i].district);
				count.push(datajson[i].cnt);
			}

			var chartdata = {
				labels: district,
				datasets : [
					{
						label: 'District Count',
						backgroundColor: 'rgba(200, 200, 200, 0.75)',
						borderColor: 'rgba(200, 200, 200, 0.75)',
						hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
						hoverBorderColor: 'rgba(200, 200, 200, 1)',
						data: count
					}
				]
			};

			var ctx = $("#piecanvas");

			var barGraph = new Chart(ctx, {
				type: 'pie',
				data: chartdata
			});
		},
		error: function(data) {
			console.log(data);
		}
	});
});
