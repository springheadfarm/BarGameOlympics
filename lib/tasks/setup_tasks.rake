namespace :setup do

	task :populate_username => :environment do
		puts "Updating athlete usernames"
		Athlete.all.each do |athlete|
			athlete.update_attribute(:username, (athlete.first_name[0]+athlete.last_name).downcase)
		end
	end

	task :clear_medals => :environment do
		puts "Clearing medal table"
		Medal.delete_all
		puts "Done."
	end

	desc "Build medals table from medals.csv"
	task :populate_medals => :environment do
		puts "Populating medals table"
		contents = File.read('public/medals.csv')
		rows = contents.split(/\n/)
		puts "Found #{rows.size}"
		rows.each do |row|
			columns = row.split(/,/)
			athlete = Athlete.find_by_username(columns[4])
			event = Event.find_by_name(columns[2])
			puts "... Processing medal"
			puts "... medal: #{columns[1]}"
			puts "... event: #{columns[2]}"
			puts "... event: #{event.name}"
			puts "... sport: #{columns[3]}"
			puts "... athlete: :#{athlete.full_name}:"
			sport = Sport.find_by_name(columns[3])
			medal = Medal.new
			medal.sport = sport
			medal.athlete = athlete
			medal.color = columns[1]
			medal.event = event
			medal.save
		end

		puts "Done."

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
			puts "... Processing match"
			puts "... Athlete 1: #{columns[1]}"
			puts "... Athlete 2: #{columns[2]}"
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