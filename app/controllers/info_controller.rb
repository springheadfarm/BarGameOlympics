class InfoController < ApplicationController
  def about
  end

  def home
  	@photo = Photo.random
  end

  def tickets
  	#render layout: 'blank'
  end

  def groupings8
  end

  def gdm
  	@matches_in_progress = Match.in_progress
  	@matches_unplayed = Match.unplayed
    @matches_completed = Match.completed
    @athletes = Athlete.active
  end
end
