Rails.application.routes.draw do

  devise_for :players
  get  '/players'   => 'players#show' #temp fix as no content yet!
  #get  '/'          => 'players#show' #temp fix as no content yet!
  root 'site#index'  
  resources :players

  post	'/increment_certinity_rate'        => 'players#increment_certinity_rate'  
  post	'/decrement_certinity_rate'        => 'players#decrement_certinity_rate'
  get 	'/matching_game_div' 				       => 'players#matching_game_div'
  post	'/increment_player_score' 	       => 'players#increment_player_score'
  post  '/trigger_request_hint_event'      => 'players#trigger_request_hint_event'
  post  '/send_first_hint'                 => 'players#send_first_hint'
  post  '/send_second_hint'                => 'players#send_second_hint'
  post  '/send_third_hint'                 => 'players#send_third_hint'
  post  '/record_solver_entry'             => 'players#record_solver_entry'
  get   '/reset_hinter_solver_views'       => 'players#reset_hinter_solver_views'                                                  
  get   '/multiplayer_game'                => 'players#multiplayer_game'
  post  '/decrement_word_repetitions'      => 'players#decrement_word_repetitions'
  get   '/change_pahse'                    => 'players#change_pahse'
  post  '/increment_no_times_mg_played'    => 'players#increment_no_times_mg_played'
  get   '/home_page'                       => 'players#show'

  post  '/pusher/auth'                     => 'pusher#auth'

end
