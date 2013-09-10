module ApplicationHelper


	def athlete_menu_item(athlete)
		content_tag(:li) do
			content_tag(:a, athlete.full_name, :href => athlete_path(athlete))
		end
	end

	def athlete_menu

		content_tag(:li, nil, :class => "dropdown") do
			
			content_tag(:a, nil, { :href => "#", :class => "dropdown-toggle", "data-toggle" => "dropdown" }) do
				"Athletes".html_safe + content_tag(:b, nil, :class => "caret")
			end +

			content_tag(:ul, nil, :class => "dropdown-menu") do
				Athlete.active.reduce('') { |c, x| 
					c << athlete_menu_item(x)
				}.html_safe +

				content_tag(:li, nil, :class => "divider")  +
				content_tag(:li, "inactive", :class => "dropdown-header") +

				Athlete.inactive.reduce('') { |c, x| 
					c << athlete_menu_item(x)
				}.html_safe
			
			end

		end

	end

	def markdown(text)
		@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
		@markdown.render(text).html_safe
	end



end

