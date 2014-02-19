class StatsController < ApplicationController

  def timing
    @elapsed_by_sport = Match.select("sport_id, avg(ended_at - started_at) as elapsed").group("sport_id").order(:elapsed).reverse_order
    @elapsed_by_athlete = Match.joins(:athletes).select("athlete_id, avg(ended_at - started_at) as elapsed").group("athlete_id").order(:elapsed).reverse_order
  end

end
