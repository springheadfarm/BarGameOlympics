class Participation < ActiveRecord::Base
  attr_accessible :athlete_id, :match_id
  belongs_to :athlete
  belongs_to :match
end
