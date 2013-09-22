ActiveAdmin.register Photo do

	index do

		column :name
		column :image do |photo|
			image_tag photo.image_url(:tiny)
		end
		default_actions

	end

end
