class ApplicationController < ActionController::Base
  protect_from_forgery
  # def current_user
  # 	binding.pry
  #   @_current_user ||= session[:user_id] &&
  #     User.find_by(id: session[:user_id])
  # end
end
