class Admin::UsersController < AdminController
  before_action :user_params, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    user = User.find(params[:user][:id])
  end

  private

  def user_params
    params.require(:user)
  end
end