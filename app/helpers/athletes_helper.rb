module AthletesHelper

	def height_for_display(athlete)
		athlete.height? ? (athlete.height/12).floor.to_s + "'" + (athlete.height%12).floor.to_s + '"' : "Undisclosed"
	end

	def weight_for_display(athlete)
		athlete.weight? ? athlete.weight.floor : "Undisclosed"		
	end

	def age_birthday_display(athlete)
		if athlete.birthday then
			((Date.today - athlete.birthday).to_i/365.floor).to_s + " (#{athlete.birthday})"
		else
			"Undisclosed"
		end
	end
end
