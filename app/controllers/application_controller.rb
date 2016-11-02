class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :assign_navigation_menu
 

   def assign_navigation_menu
   	@categories = Category.all
   end


end
