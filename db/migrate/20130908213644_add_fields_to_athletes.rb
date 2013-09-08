class AddFieldsToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :active, :boolean
    add_column :athletes, :height, :float
    add_column :athletes, :weight, :float
    add_column :athletes, :profile, :string
  end
end
