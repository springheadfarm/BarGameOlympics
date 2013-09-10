class ChangeProfileToText < ActiveRecord::Migration
  def up
  	change_column :athletes, :profile, :text
  end

  def down
  end
end
