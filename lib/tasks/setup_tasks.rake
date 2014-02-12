namespace :setup do

	task :populate_username => :environment do
		puts "Updating athlete usernames"
		Athlete.all.each do |athlete|
			athlete.update_attribute(:username, (athlete.first_name[0]+athlete.last_name).downcase)
		end
	end

	task :populate_matches => :environment do
		
		puts "Removing old matches"
		Match.delete_all
		Participation.delete_all

		puts "Building new matches"
		contents = File.read('public/matches.csv')
		rows = contents.split(/\n/)
		rows.each do |row|
			columns = row.split(/,/)
			a1 = Athlete.find_by_username(columns[1])
			a2 = Athlete.find_by_username(columns[2])
			sport = Sport.find_by_name(columns[0])
			group = columns[3]
			match = Match.new
			match.sport = sport
			match.group = group
			match.save
			p = Participation.new
			p.athlete = a1
			p.match = match
			p.save
			p = Participation.new
			p.athlete = a2
			p.match = match
			p.save
		end

		puts "Done."
	end

end