class PollResponse < ActiveRecord::Base
  attr_accessible :poll_id, :poll_answer_id
  belongs_to :poll
end
