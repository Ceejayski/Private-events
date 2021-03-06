class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      session[:user_id] = user.id
      redirect_to events_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Name is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end

  def index
    redirect_to login_path
  end
end
