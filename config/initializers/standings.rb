class Standings
	
	def self.test
		s = Standings.new
		s.calculate
		s	
	end

	def calculate
		@athletes = Athlete.active
		@standings = Hash.new()
		Sport.all.each { |sport|
			lb = SCR.new(@athletes, :rank_by => sport, :sort_direction => :desc)
		    blb = lb.calculate
		    h = Hash[blb.collect { |r| [r[:username],r[:points]]}]
		    @standings[sport.name] = h	
		}
	end
	
	def athletes_ordered_by(what)
		@athletes
	end

	def points(athlete,sport)
		h = @standings[sport.name]
		h[athlete.username]
	end

	def standings
		@standings
	end
end