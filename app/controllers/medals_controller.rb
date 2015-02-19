class MedalsController < ApplicationController
	respond_to :json, :only => :heatmap_data

	def heatmap_data
		data = Hash.new

		Athlete.all.each do |a|
			sport_hash = Hash.new
			Sport.all.each do |s|
				sport_hash[s.name] = a.medals.where(:sport_id => s.id).group(:color).count
			end
			data[a.full_name] = sport_hash
		end
		respond_with(data)
	end
end
