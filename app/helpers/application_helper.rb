module ApplicationHelper

	def title(page_title)
	  content_for :title, page_title.to_s
	end
	
	def navbar_link(text, link)
		content_tag(:li) do
			content_tag(:a, text, :href => link)
		end
	end

	def athlete_menu_item(athlete)
		navbar_link athlete.full_name, athlete_path(athlete)
	end

	def athlete_menu

		content_tag(:li, nil, :class => "dropdown") do
			
			content_tag(:a, nil, { :href => "#", :class => "dropdown-toggle", "data-toggle" => "dropdown" }) do
				"Athletes".html_safe + content_tag(:b, nil, :class => "caret")
			end +

			content_tag(:ul, nil, :class => "dropdown-menu") do

				content_tag(:li, "active", :class => "dropdown-header") +

				Athlete.active.order('last_name, first_name').reduce('') { |c, athlete| 
					c << athlete_menu_item(athlete)
				}.html_safe +

				content_tag(:li, nil, :class => "divider")  +
				content_tag(:li, "inactive", :class => "dropdown-header") +

				Athlete.inactive.order('last_name, first_name').reduce('') { |c, athlete| 
					c << athlete_menu_item(athlete)
				}.html_safe
			
			end

		end

	end

	def markdown(text)
		@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :disable_indented_code_blocks => true)
		@markdown.render(text).html_safe
	end



end

