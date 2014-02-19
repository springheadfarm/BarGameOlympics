jQuery ->
	if $(".scrollable").length
		$(".scrollable").scrollable({ vertical: true, mousewheel: true })

	$(".assign-button").each (index,button) =>

		sport = $(button).attr("data_sport")
		$(button).removeAttr("disabled")
		ac = $("tr[data-sport='"+sport+"'][data-possible='true']").size()
		if !ac
			$(button).attr("disabled", "disabled")

