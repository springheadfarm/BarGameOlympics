class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :author
      t.text :markdown
      t.datetime :written_at
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
