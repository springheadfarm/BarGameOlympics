
class Athlete < ActiveRecord::Base
  # One instance for each BGO athlete
  # Holds descriptive information and an image used in the profile

  attr_accessible :first_name, :last_name, :birthday, :active, :height, :weight, :profile, :image, :remote_image_url, :username

  has_many :medals
  has_many :participations
  has_many :matches, :through => :participations
  accepts_nested_attributes_for :matches, :participations

  mount_uploader :image, ImageUploader

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  scope :active_ordered_by_matches_unplayed, -> {joins(:matches).where('matches.started_at is NULL and matches.year=2015').group('athletes.id').order("count(matches.id) desc")}
  
  def full_name
  	last_name + ', ' + first_name
  end

  def idle?
    !(Match.in_progress.map(&:athlete1)+Match.in_progress.map(&:athlete2)).include?(self)
  end

  def wins_in(sport)
    self.matches.completed.where(winner_id: self.id).where(sport_id: sport.id).count
  end

  def losses_in(sport)
    self.matches.completed.where(loser_id: self.id).where(sport_id: sport.id).count
  end

  def rank_in(sport)
    athletes = Athlete.active.sort_by { |a| -a.wins_in(sport) }
    ranks = *(1..10)
    athlete_ids = athletes.map { |a| a.id }
    rank_hash = Hash[athlete_ids.zip(ranks)]
    rank_hash[self.id]
  end

  def points_in(sport)
    points = [0,12,10,8,6,5,4,3,2,1,0]
    points[rank_in(sport)]
  end

  def self.username_from_full_name(full_name)
    (full_name.split(/,/)[1][1] + full_name.split(/,/)[0]).downcase
  end
end
