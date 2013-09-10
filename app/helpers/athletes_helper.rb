module AthletesHelper

	def height_for_display(athlete)
		athlete.height? ? (athlete.height/12).floor.to_s + "'" + (athlete.height%12).floor.to_s + '"' : "Undisclosed"
	end

	def weight_for_display(athlete)
		athlete.weight? ? athlete.weight.floor : "Undisclosed"		
	end
end
