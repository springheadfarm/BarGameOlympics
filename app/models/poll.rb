class Poll < ActiveRecord::Base

  scope :active, -> { where(active: true) }

  attr_accessible :question, :active
  has_many :poll_answers
  has_many :poll_responses

	def self.random

		where(:active => true).sample(1)
		
	end

	def total_votes
		poll_answers.sum('votes')		
	end

end
