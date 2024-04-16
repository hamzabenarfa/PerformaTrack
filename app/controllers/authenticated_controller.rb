class AuthenticatedController < ApplicationController
  layout 'authenticated'
  before_action :authenticate_user!, except: :handle_unknown_routes
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def handle_unknown_routes
    if user_signed_in?
      redirect_to dashboard_index_path, alert: "The page you're looking for doesn't exist."
    else
      redirect_to new_user_session_path, alert: "Please log in to continue."
    end
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :password, :password_confirmation])
  end
        
end
