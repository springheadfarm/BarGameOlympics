class Medal < ActiveRecord::Base
  attr_accessible :athlete_id, :color, :event_id, :sport_id

  belongs_to :athlete
  belongs_to :event
  belongs_to :sport

  scope :gold, -> { where(color: 'Gold') }

  def self.in_sport(sport)
  	where(:sport_id => sport.id)  	
  end

end
