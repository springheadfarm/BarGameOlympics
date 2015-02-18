/*
a.medals.joins(:sport).group_by{|e| [e.sport.name, e.color]}.map{|k,v| [k.first, k.last, v.length]}
*/

$(function () {

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

// Add the background image to the container
Highcharts.wrap(Highcharts.Chart.prototype, 'getContainer', function (proceed) {
   proceed.call(this);
   this.container.style.background = 'url(http://www.highcharts.com/samples/graphics/sand.png)';
});


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

	var data = {
		"Greg Rogers": {
			"Foosball": {
				"Gold": 3,
				"Silver": 3,
				"Bronze": 1
			},
			"Darts": {
				"Gold": 0,
				"Silver": 1,
				"Bronze": 1
			},
			"Shuffleboard": {
				"Gold": 0,
				"Silver": 1,
				"Bronze": 3
			},
			"Ping Pong": {
				"Gold": 1,
				"Silver": 0,
				"Bronze": 3
			},
			"Golden Tee": {
				"Gold": 0,
				"Silver": 0,
				"Bronze": 1
			},
			"Pool": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			}
		},
		"Doug Dixon": {
			"Foosball": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Darts": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Shuffleboard": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Ping Pong": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Golden Tee": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Pool": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			}
		},
		"Rob Louka": {
			"Foosball": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Darts": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Shuffleboard": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Ping Pong": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Golden Tee": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Pool": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			}
		},
		"John Reardon": {
			"Foosball": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Darts": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Shuffleboard": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Ping Pong": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Golden Tee": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Pool": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			}
		},
		"Scott Wible": {
			"Foosball": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Darts": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Shuffleboard": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Ping Pong": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Golden Tee": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Pool": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			}
		},
		"Kris Goddard": {
			"Foosball": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Darts": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Shuffleboard": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Ping Pong": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Golden Tee": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Pool": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			}
		},
		"Mark Radtke": {
			"Foosball": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Darts": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Shuffleboard": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Ping Pong": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Golden Tee": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			},
			"Pool": {
				"Gold": 1,
				"Silver": 1,
				"Bronze": 1
			}
		}
	};
	var points = [],
		athlete_p,
		athlete_val,
		athlete_i,
		sport_p,
		sport_i,
		sport_val,
		medal_i;

	athlete_i = 0;
	for (var athlete in data) {
		athlete_val = 0;
		athlete_p = {
			id: "id_" + athlete_i,
			name: athlete,
			color: Highcharts.getOptions().colors[athlete_i]
		};
		sport_i = 0;
		for (var sport in data[athlete]) {
			sport_p = {
				id: athlete_p.id + "_" + sport_i,
				name: sport,
				parent: athlete_p.id
			};
			points.push(sport_p);
			medal_i = 0;
			for (var medal in data[athlete][sport]) {
				medal_p = {
					id: sport_p.id + "_" + medal_i,
					name: medal,
					parent: sport_p.id,
					value: data[athlete][sport][medal]
				};
				athlete_val += medal_p.value;
				points.push(medal_p);
				medal_i++;
			}
			sport_i++;
		}
		athlete_p.value = athlete_val;
		points.push(athlete_p);
		athlete_i++;
	}
	var chart = new Highcharts.Chart({
		chart: {
			renderTo: 'heatmap_container'
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
			data: points
		}],
		subtitle: {
			text: 'Click points to drill down. Source: <a href="http://www.bargameolympics.com">BGO</a>.'
		},
		title: {
			text: 'Career BGO Medals'
		}
	});
});