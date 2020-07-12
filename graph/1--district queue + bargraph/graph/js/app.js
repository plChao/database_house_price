$(document).ready(function(){
	$.ajax({
		url: "http://localhost/graph/data.php",
		method: "GET",
		success: function(data) {
			var datajson = JSON.parse(data);
			console.log(data);
			var district = [];
			var count = [];
			//console.log(datajson[3].playerid);
			for(var i in datajson) {
				//console.log(data);
				//console.log("\n"+data.score);
				district.push(datajson[i].district);
				//console.log(data[i].playerid);
				count.push(datajson[i].cnt);
				//console.log("\npull element "+player+" "+score);
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

			var ctx = $("#mycanvas");

			var barGraph = new Chart(ctx, {
				type: 'bar',
				data: chartdata
			});
		},
		error: function(data) {
			console.log(data);
		}
	});
});
