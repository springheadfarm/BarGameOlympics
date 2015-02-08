class Sport < ActiveRecord::Base
  attr_accessible :name

  has_many :matches

  has_many :medals

  accepts_nested_attributes_for :matches

  @@sports = Hash.new
  all.each { |s| @@sports[s.name.parameterize.underscore.to_sym] = s.name }

  def self.method_missing(name, *args)
  	# Handle set of methods to return specific sports

  	if @@sports.has_key?(name)
  		find_by_name(@@sports[name])
  	else
	  	super	
  	end
  end

end
