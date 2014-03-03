class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.string :color
      t.integer :event_id
      t.integer :athlete_id
      t.integer :sport_id

      t.timestamps
    end
  end
end
