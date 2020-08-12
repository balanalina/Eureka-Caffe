class SessionsController < ApplicationController
  def new; end

  def login
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      reset_session
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination!'
      render 'new'
    end
  end


  def logout
    log_out if logged_in?
    redirect_to root_url
  end
end
