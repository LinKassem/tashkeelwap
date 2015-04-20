class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.	
  protect_from_forgery with: :exception

  # Call-backs
  before_filter :authenticate_player_from_token!
  before_action :authenticate_player!, :except => [:show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Mehthods

  # Redirect to a player#show on successful sign in 
  def after_sign_in_path_for(resource)
    current_player
  end

  # Redirect to a player#show on successful sign up 
  def after_sign_up_path_for(resource)
    current_player
  end

  # Redirect to a site#index on sign out 
  def after_sign_out_path_for(resource)
    root_path
  end

protected 
  # Extra token authentication mechanism
  def authenticate_player_from_token!
    player_email = params[:player_email].presence
    player       = player_email && Player.find_by_email(player_email)
    if player && Devise.secure_compare(player.authentication_token, params[:player_token])
      sign_in player, store: false
    end
  end

	# To allow passing of field parameters in signup or update account forms
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, 
			:email, :password, :password_confirmation,:score) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, 
			:email, :current_password, :password, :password_confirmation, :score) }
	end

end
