class AddImageToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :image, :string
  end
end
