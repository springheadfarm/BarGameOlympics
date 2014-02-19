module InfoHelper

	 def ticket_package(image, &block)
	 	content_tag(:div, :class=>"item") do
	 		image_tag("ticket_package_#{image}") +
	 		markdown(capture(&block).strip)
	 	end
	 end

	 def action_buttons(arena)
	 	if arena.in_use? then
		 	link_to("record result", record_match_path(arena.current_match.id), {:class => "btn btn-warning btn-xs"}) + "|" +
		 	link_to("cancel", cancel_match_path(arena.current_match.id), {:class => "btn btn-danger btn-xs"})
		 else
		 	#link_to("assign", new_match_path, {:class => "btn btn-primary btn-xs"})
		 	link_to(
		 		"assign", 
		 		{ :controller => 'matches', :action => 'new', :arena_id => "#{arena.id}" } , 
		 		{ :class => "btn btn-primary btn-xs assign-button", :data_sport => "#{arena.sport.name}" }
		 	)
		 end
	 end
	

end
