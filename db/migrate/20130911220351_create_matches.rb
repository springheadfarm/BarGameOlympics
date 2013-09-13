class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :sport_id
      t.integer :venue_id
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps
    end
  end
end
