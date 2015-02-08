class AddYearToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :year, :integer
  end
end
