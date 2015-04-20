Rails.application.routes.draw do

  devise_for :players

  root 'site#index'
  resources :players

  post	'/increment_certinity_rate' => 'players#increment_certinity_rate'  
  post	'/decrement_certinity_rate' => 'players#decrement_certinity_rate'
  get 	'/matching_game_div' 				=> 'players#matching_game_div'
  post	'/increment_player_score' 	=> 'players#increment_player_score'
  post  '/trigger_request_hint_event' => 'players#trigger_request_hint_event'
  post  '/send_first_hint'          => 'players#send_first_hint'
  post  '/send_second_hint'         => 'players#send_second_hint'
  post  '/send_third_hint'         => 'players#send_third_hint'

  get   '/multiplayer_game' => 'players#multiplayer_game'

  post '/players/test' => 'players#test'
  post '/pusher/auth' => 'pusher#auth'


end
