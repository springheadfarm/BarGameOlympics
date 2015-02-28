class InfoController < ApplicationController
  def about
  end

  def home
  	@photo = Photo.random
    @news = Article.last(5).reverse!
  end

  def tickets
  	#render layout: 'blank'
  end

  def groupings8
  end

  def rules_darts
  end

  def rules_golden_tee
  end

  def rules_pool
  end

  def rules_shuffleboard
    
  end

  def rules_foosball
    
  end

  def rules_ping_pong
    
  end

  def gdm
  	@matches_in_progress = Match.in_progress
  	@matches_unplayed = Match.unplayed
    @matches_completed = Match.completed
    @athletes = Athlete.active_ordered_by_matches_unplayed
  end

  def standings
    @standings = Standings.new
    @standings.calculate
  end
end
