module InfoHelper

	 def ticket_package(image, &block)
	 	content_tag(:div, :class=>"item") do
	 		image_tag(image) +
	 		markdown(capture(&block).strip)
	 	end
	 end

end
