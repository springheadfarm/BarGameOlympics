class AddVotesToPollAnswers < ActiveRecord::Migration
  def change
    add_column :poll_answers, :votes, :integer
  end
end
