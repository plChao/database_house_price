$(document).ready(function(){
	$.ajax({
		url: "http://localhost/graph/pie_data.php",
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
						data: count//,
						//backgroundColor: palette('tol-sq',).map(function(hex){
							//return '#' + hex;
						//})
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
