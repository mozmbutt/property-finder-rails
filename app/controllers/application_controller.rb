class ApplicationController < ActionController::Base
  before_action :configure_permitted_perameters, if: :devise_controller?

  protected

  def configure_permitted_perameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:update, keys: [:first_name, :last_name, :url])
  end
end
