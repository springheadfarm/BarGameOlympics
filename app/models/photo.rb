class Photo < ActiveRecord::Base
  attr_accessible :name, :image, :gallery_id, :remote_image_url

  belongs_to :gallery

	mount_uploader :image, ImageUploader

	def self.random
		if (c=count) != 0
			order("RANDOM()").first
			#find(:first, :offset => rand(c))
		end
	end

end


