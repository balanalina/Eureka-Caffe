class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def destroy

  end
end