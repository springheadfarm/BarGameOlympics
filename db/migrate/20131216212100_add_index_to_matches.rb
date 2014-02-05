class AddIndexToMatches < ActiveRecord::Migration
  def change
  	add_index :matches, :sport_id
    add_index :matches, :venue_id
  end
end
