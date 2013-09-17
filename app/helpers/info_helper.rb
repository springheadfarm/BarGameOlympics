module InfoHelper

	 def ticket_package(image, &block)
	 	content_tag(:div, :class=>"item") do
	 		image_tag("ticket_package_#{image}") +
	 		markdown(capture(&block).strip)
	 	end
	 end

end
