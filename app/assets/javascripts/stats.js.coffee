jQuery ->
	if $("#medals-by-sport").length
		$("#medals-by-sport").tablesorter
			theme: 'ice'
			sortList: [[7,1]]
			headerTemplate: '{content}{icon}'
			widgets: ["columns"]
