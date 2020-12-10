class UsersController < ApplicationController
  include UsersHelper
  before_action :authorization, except: %i[create new]

  def index
    @user = User.all
    @user_reject = @user.reject { |user| user == Event.find(params[:event_id]).creator }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'user was successfully created'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end
end
