class Admin::UsersController < AdminController
  before_action :user_params, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to admin_users_url
      flash[:success] = 'User deleted!'
    else
      redirect_to admin_users_url
      flash[:danger] = 'Could not delete user!'
    end
  end

  private

    def user_params
      params.require(:id)
    end
end