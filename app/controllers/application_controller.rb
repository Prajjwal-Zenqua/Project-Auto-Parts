class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Method to configure the default and additional attributes for Devise (e.g., sign_up and account_update)
  def configure_permitted_parameters
    # Permit additional parameters on sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :status])
    
    # Permit additional parameters on account update
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :status])
  end
end

