class CreatePollAnswers < ActiveRecord::Migration
  def self.up
    create_table :poll_answers do |t|
      t.integer :poll_id
      t.text :answer
      t.timestamps
    end
  end

  def self.down
    drop_table :poll_answers
  end
end
