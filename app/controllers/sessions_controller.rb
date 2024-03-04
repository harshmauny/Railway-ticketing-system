
class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    # find if the user is present in Passenger table
    user = Passenger.find_by_email(params[:email_address])
    if user && user.authenticate(params[:password])
      # create session for the current user
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to new_session_url, alert: "Email or password is invalid"
    end
  end

  def destroy
    # making the session nil
    session[:user_id] = nil
    # redirect to home page after  user is logged out
    redirect_to root_url
  end
end
