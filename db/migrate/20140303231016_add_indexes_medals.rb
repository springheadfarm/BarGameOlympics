class AddIndexesMedals < ActiveRecord::Migration
  def up
  	add_index :medals, :event_id
  	add_index :medals, :athlete_id
  	add_index :medals, :sport_id
  end

end
