class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :athlete_id
      t.integer :match_id

      t.timestamps
    end
  end
end
