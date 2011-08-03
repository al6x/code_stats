var Report = {};
Report.plot = function(selector, projects){  
  var sources = [], specs = [], labels = [];
  for(var i = 0; i < projects.length; i++){
    var project = projects[i];
    labels.push(project[0]);
    sources.push(project[1]);
    specs.push(project[2]);
  }
    
	var chart = new Highcharts.Chart({
		chart: {
			renderTo: 'plot',
			defaultSeriesType: 'column'
		},
		title: {
			text: null // 'Stacked column chart'
		},
		xAxis: {
			categories: labels,
			labels: {
			  rotation: -45, 
			  align: 'right'
			}
		},
		yAxis: {
			min: 0,
			title: {
				text: 'Characters Count'
			},
			stackLabels: {
				enabled: true,
				style: {
					fontWeight: 'bold',
					color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
				}
			}
		},
		legend: {
			align: 'right',
			x: -100,
			verticalAlign: 'top',
			y: 20,
			floating: true,
			backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
			borderColor: '#CCC',
			borderWidth: 1,
			shadow: false
		},
		tooltip: {
			formatter: function() {
				return '<b>'+ this.x +'</b><br/>'+
					 this.series.name +': '+ this.y +'<br/>'+
					 'Total: '+ this.point.stackTotal;
			}
		},
		plotOptions: {
			column: {
				stacking: 'normal',
				dataLabels: {
					enabled: true,
					color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
				}
			}
		},		
    series: [{
      name: 'Specs',
			data: specs			
		}, {			
		  name: 'Sources',
			data: sources
		}]
	});

};