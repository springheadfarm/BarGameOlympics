class PollAnswer < ActiveRecord::Base
  attr_accessible :poll_id, :answer, :votes
  belongs_to :poll

  after_initialize :init

  def percent
  	((votes.to_f / poll.total_votes) * 100).round(0)
  end

  def init
  	self.votes ||= 0
  end

  def vote
  	update_attribute(:votes, votes+1)
  end

end
