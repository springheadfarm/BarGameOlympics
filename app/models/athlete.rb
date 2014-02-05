
class Athlete < ActiveRecord::Base
  # One instance for each BGO athlete
  # Holds descriptive information and an image used in the profile

  attr_accessible :first_name, :last_name, :birthday, :active, :height, :weight, :profile, :image, :remote_image_url

  has_many :participations
  has_many :matches, :through => :participations
  accepts_nested_attributes_for :matches, :participations

  mount_uploader :image, ImageUploader

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def full_name
  	last_name + ', ' + first_name
  end
end
