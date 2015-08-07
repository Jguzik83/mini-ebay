class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid Login Credentials"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
