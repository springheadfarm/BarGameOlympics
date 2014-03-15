class AddIndexesToArenas < ActiveRecord::Migration
  def change
  	 add_index :arenas, :venue_id
  	 add_index :arenas, :sport_id
  end
end
