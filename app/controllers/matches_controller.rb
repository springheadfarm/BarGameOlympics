class MatchesController < ApplicationController

	def index
		@matches = Match.all
	end

	def new
		@arena = Arena.find(params[:arena_id])
		@possible_matches = @arena.possible_matches
	end

	def start
		@match = Match.find(params[:match_id])
		@arena = Arena.find(params[:arena_id])
		@match.update_attribute(:started_at, Time.zone.now)
		@match.arena = @arena
		@match.save
		redirect_to gdm_path
	end

	def cancel
		@match = Match.find(params[:match_id])
		@match.update_attribute(:started_at, nil)
		@match.update_attribute(:arena_id, nil)
		redirect_to gdm_path
	end

	def record
		@match = Match.find(params[:match_id])
	end

	def record_winner
		match = Match.find(params[:match_id])
		full_name = params[:commit]
		result_string = params[:result_string]
		username = Athlete.username_from_full_name(full_name)
		winner_athlete = Athlete.find_by_username(username)
		loser_athlete = (winner_athlete == match.athlete1) ? match.athlete2 : match.athlete1
		match.update_attribute(:ended_at, Time.zone.now)
		match.update_attribute(:winner_id, winner_athlete.id)
		match.update_attribute(:loser_id, loser_athlete.id)
		match.update_attribute(:note,result_string)
		redirect_to gdm_path
	end
end
