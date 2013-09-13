class Match < ActiveRecord::Base
  attr_accessible :ended_at, :loser_id, :sport_id, :started_at, :venue_id, :winner_id

  has_many :participations
  has_many :athletes, :through => :participations

  accepts_nested_attributes_for :athletes, :participations

  belongs_to :venue
  belongs_to :sport
end
