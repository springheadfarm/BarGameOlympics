class CreateAthletes < ActiveRecord::Migration
  def self.up
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.timestamps
    end
  end

  def self.down
    drop_table :athletes
  end
end
