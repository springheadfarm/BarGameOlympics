module ApplicationHelper

	def athlete_menu

		content_tag(:li, nil, :class => "dropdown") do
			
			content_tag(:a, nil, { :href => "#", :class => "dropdown-toggle", "data-toggle" => "dropdown" }) do
				"Athletes".html_safe + content_tag(:b, nil, :class => "caret")
			end +

			content_tag(:ul, nil, :class => "dropdown-menu") do
				content_tag(:li) do
					content_tag(:a, "somebody", :href => "#")
				end +
				content_tag(:li, nil, :class => "divider")  +
				content_tag(:li) do
					content_tag(:a, "somebody", :href => "#")
				end
			end

		end

	end

end

