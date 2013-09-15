jQuery ->
	if $(".scrollable").length
		$(".scrollable").scrollable({ vertical: true, mousewheel: true })