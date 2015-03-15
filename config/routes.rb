BarGameOlympics::Application.routes.draw do

  get "medals/heatmap_data"

  resources :articles

  resources :photos
  resources :galleries
  resources :sports
  resources :athletes

  resources :matches

  # changed the next 4 to GET from MATCH
  get 'matches/:match_id/:arena_id/start' => 'matches#start', :as => :start_match
  get 'matches/:match_id/cancel' => 'matches#cancel', :as => :cancel_match
  get 'matches/:match_id/record' => 'matches#record', :as => :record_match
  get 'matches/:match_id/record_winner' => 'matches#record_winner'

  resources :poll_responses
  resources :poll_answers
  resources :polls

  %w[home about tickets groupings8 gdm standings rules_darts rules_shuffleboard rules_ping_pong rules_golden_tee rules_foosball rules_pool].each do |page|
    get page, controller: 'info', action: page
  end

  %w[timing medals medals_heatmap].each do |page|
    get "stats/#{page}", controller: 'stats', action: page
  end



  root :to => 'info#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


end
