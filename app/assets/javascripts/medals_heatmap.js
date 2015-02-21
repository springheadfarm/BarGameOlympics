
$(function () {

if($('#heatmap_container').length)
	{


	/**
	 * Sand-Signika theme for Highcharts JS
	 * @author Torstein Honsi
	 */

	// Load the fonts
	Highcharts.createElement('link', {
		href: '//fonts.googleapis.com/css?family=Signika:400,700',
		rel: 'stylesheet',
		type: 'text/css'
	}, null, document.getElementsByTagName('head')[0]);

	Highcharts.theme = {
		colors: ["#f45b5b", "#8085e9", "#8d4654", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
			"#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
		chart: {
			backgroundColor: null,
			style: {
				fontFamily: "Signika, serif"
			}
		},
		title: {
			style: {
				color: 'black',
				fontSize: '16px',
				fontWeight: 'bold'
			}
		},
		subtitle: {
			style: {
				color: 'black'
			}
		},
		tooltip: {
			borderWidth: 0
		},
		legend: {
			itemStyle: {
				fontWeight: 'bold',
				fontSize: '13px'
			}
		},
		xAxis: {
			labels: {
				style: {
					color: '#6e6e70'
				}
			}
		},
		yAxis: {
			labels: {
				style: {
					color: '#6e6e70'
				}
			}
		},
		plotOptions: {
			series: {
				shadow: true
			},
			candlestick: {
				lineColor: '#404048'
			},
			map: {
				shadow: false
			}
		},

		// Highstock specific
		navigator: {
			xAxis: {
				gridLineColor: '#D0D0D8'
			}
		},
		rangeSelector: {
			buttonTheme: {
				fill: 'white',
				stroke: '#C0C0C8',
				'stroke-width': 1,
				states: {
					select: {
						fill: '#D0D0D8'
					}
				}
			}
		},
		scrollbar: {
			trackBorderColor: '#C0C0C8'
		},

		// General
		background2: '#E0E0E8'
		
	};

	// Apply the theme
	Highcharts.setOptions(Highcharts.theme);
	function request_heatmap_data() {
	    $.getJSON('/medals/heatmap_data.json', function(data) {

	function ColorLuminance(hex, lum) {

		// validate hex string
		hex = String(hex).replace(/[^0-9a-f]/gi, '');
		if (hex.length < 6) {
			hex = hex[0]+hex[0]+hex[1]+hex[1]+hex[2]+hex[2];
		}
		lum = lum || 0;

		// convert to decimal and change luminosity
		var rgb = "#", c, i;
		for (i = 0; i < 3; i++) {
			c = parseInt(hex.substr(i*2,2), 16);
			c = Math.round(Math.min(Math.max(0, c + (c * lum)), 255)).toString(16);
			rgb += ("00"+c).substr(c.length);
		}
		return rgb;
	}


	    	var points = [],
			athlete_p,
			athlete_val,
			athlete_i,
			sport_p,
			sport_i,
			sport_val,
			medal_i,
			color;


		athlete_i = 0;
		for (var athlete in data) {
			athlete_val = 0;
			athlete_p = {
				id: "id_" + athlete_i,
				name: athlete,
				color: Highcharts.getOptions().colors[athlete_i % 11]
			};
			sport_i = 0;
			for (var sport in data[athlete]) {

				color = ColorLuminance(athlete_p.color, 0.2 * (Math.random() - 0.5));
		
				sport_p = {
					id: athlete_p.id + "_" + sport_i,
					name: sport,
					parent: athlete_p.id,
					color: color			};
				sport_val = 0;
				medal_i = 0;
				for (var medal in data[athlete][sport]) {
					medal_p = {
						id: sport_p.id + "_" + medal_i,
						name: medal + " (" + data[athlete][sport][medal] + ")",
						parent: sport_p.id,
						value: data[athlete][sport][medal]
					};
					athlete_val += medal_p.value;
					sport_val += medal_p.value;
					points.push(medal_p);
					medal_i++;
				}
				sport_i++;
				sport_p.name += " (" + sport_val + ")";
				points.push(sport_p);
			}
			athlete_p.value = athlete_val;
			athlete_p.name += " (" + athlete_val + ")"
			points.push(athlete_p);
			athlete_i++;
		}
	            
	    chart.series[0].setData(points, true) ;


	    }) ;
	}

		var chart = new Highcharts.Chart({
			chart: {
				renderTo: 'heatmap_container',
				events: {
	                load: request_heatmap_data()
	            }
			},
			tooltip: {
				enabled: false
			},
			series: [{
				type: "treemap",
				layoutAlgorithm: 'squarified',
				allowDrillToNode: true,
				dataLabels: {
					enabled: false
				},
				levelIsConstant: false,
				levels: [{
					level: 1,
					dataLabels: {
						enabled: true
					},
					borderWidth: 3
				}],
				data: []
			}],
			subtitle: {
				text: 'Click points to drill down. Source: <a href="http://www.bargameolympics.com">BGO</a>.'
			},
			title: {
				text: 'Career BGO Medals'
			}
		});
	}
});

