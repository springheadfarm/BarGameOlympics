class AddSportIdToArena < ActiveRecord::Migration
  def change
    add_column :arenas, :sport_id, :integer
  end
end
