class Arena < ActiveRecord::Base
  attr_accessible :name, :venue_id, :sport_id

  belongs_to :venue
    delegate :name, :to => :venue, :prefix => true

  belongs_to :sport
  has_many :matches

  def status
  	self.in_use? ? "In use" : "Available"	
  end

  def in_use?
  	!self.matches.in_progress.empty?
  end

  def possible_matches
  	# neeeds to return unplayed matches for this arena's sport where both athletes are idle
  	matches = Match.unplayed.where("sport_id = ?", self.sport.id)
    matches.select { |m| m.possible? }
  end

  def current_match
    self.matches.in_progress.first
  end
end
