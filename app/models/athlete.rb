class Athlete < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :birthday, :active, :height, :weight, :profile, :image, :remote_image_url

  mount_uploader :image, ImageUploader

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def full_name
  	last_name + ', ' + first_name
  end
end
