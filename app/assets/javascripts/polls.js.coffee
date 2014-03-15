jQuery ->

	# May want to change this to only render the results once answer is submitted
	$('.poll-results').hide()

	$('.poll-submit').click (event) ->
		event.preventDefault()
		$('.poll-question').hide()

		# TODO: Update poll answers pane
		# Possible render it now

		poll_id = $('.poll-question').attr('data-poll-id')

		answer_id = $('input[name=poll_answer]:checked', '#poll_form').val()
		answer_url = '/poll_answers/' + answer_id
		$.getScript(answer_url)

		poll_url = '/polls/' + poll_id
		$.getScript(poll_url)

		$('.poll-results').show()

