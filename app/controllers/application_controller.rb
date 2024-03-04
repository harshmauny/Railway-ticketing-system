class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authorized

  def current_user
    if session[:user_id]
      # search for current_user or find in session
      @current_user ||= Passenger.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  
  def authorized
    return if current_user
    # redirect_to root_path unless logged_in?
    redirect_to root_path
  end

end
