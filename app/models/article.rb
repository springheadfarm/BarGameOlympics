class Article < ActiveRecord::Base
  attr_accessible :author, :markdown, :written_at, :title
end
