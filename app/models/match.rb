class Match < ActiveRecord::Base
  attr_accessible :ended_at, :loser_id, :sport_id, :started_at, :venue_id, :winner_id, :arena_id, :group, :note

  has_many :participations, :dependent => :destroy
  has_many :athletes, :through => :participations

  accepts_nested_attributes_for :athletes, :participations

  belongs_to :venue

  belongs_to :arena
  delegate :name, :to => :arena, :prefix => true

  belongs_to :sport
  delegate :name, :to => :sport, :prefix => true

  scope :unplayed, 		-> { where("started_at is NULL and year=2015") }
  scope :in_progress,	-> { where("started_at is NOT NULL AND ended_at is NULL and year=2015") }
  scope :completed,   -> { where("ended_at is NOT NULL and year=2015") }

  def elapsed_time
    Time.now - self.started_at
  end

  def elapsed_time_string
    (elapsed_time / 60).floor.to_s + ":" + '%02d' % ((elapsed_time % 60).floor)
  end

  def athlete1
    athletes.order(:id).first
  end

  def athlete2
    athletes.order(:id).last
  end

  def possible?
    self.athlete1.idle? && self.athlete2.idle?
  end
end

