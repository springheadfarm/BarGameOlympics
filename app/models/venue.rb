class Venue < ActiveRecord::Base
  attr_accessible :name

  has_many :matches
  accepts_nested_attributes_for :matches

end
