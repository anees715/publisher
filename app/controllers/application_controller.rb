class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :assign_navigation_menu
  before_action :configure_permitted_parameters, if: :devise_controller?


  def assign_navigation_menu
    @categories = Category.all
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end


end
