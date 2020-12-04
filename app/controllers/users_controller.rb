class UsersController < ApplicationController
  include UsersHelper
  before_action :authorization, only: [:show]

  # def index
  #   @user = User.all
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'user was successfully created'
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end

end
