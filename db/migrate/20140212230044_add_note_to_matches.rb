class AddNoteToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :note, :string
  end
end
