class CreateArenas < ActiveRecord::Migration
  def change
    create_table :arenas do |t|
      t.string :name
      t.integer :venue_id

      t.timestamps
    end
  end
end
