class Photo < ActiveRecord::Base
  attr_accessible :name, :image, :gallery_id, :remote_image_url

  belongs_to :gallery

	mount_uploader :image, ImageUploader

end


