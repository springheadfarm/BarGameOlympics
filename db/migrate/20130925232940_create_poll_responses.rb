class CreatePollResponses < ActiveRecord::Migration
  def self.up
    create_table :poll_responses do |t|
      t.integer :poll_id
      t.integer :poll_answer_id
      t.timestamps
    end
  end

  def self.down
    drop_table :poll_responses
  end
end
