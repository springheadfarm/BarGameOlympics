class Event < ActiveRecord::Base
  attr_accessible :date, :name

  has_many :medals
end
