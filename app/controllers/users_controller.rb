class UsersController < ApplicationController
  before_action :logged_in_user, :correct_user, only: %i[edit update show]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_mail
      flash[:info] = "Please check you email to activate your account!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = 'Profile edited!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'You must be logged in!'
      redirect_to new_session_url
    end
  end

  def current_user?(user)
    user && user == current_user
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user? @user
  end
end
