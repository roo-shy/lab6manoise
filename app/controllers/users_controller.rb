class UsersController < ApplicationController

  before_action :authenticate_user, only: [:follow, :delete]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @users = User.all
    # @users = @current_user.following_users
    @user = User.new params.require(:user).permit(:username, :password, :password_confirmation)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    end
  end

  def follow
    user = User.find params[:id]
      @current_user.follow user
        redirect_to dashboard_path, notice: "You just followed #{user.username}"
  end

  def delete
    user = User.find params[:id]
    @current_user.stop_following user
    redirect_to dashboard_path, notice: "You just unfollowed #{user.username}"
  end

  def show
    @user=User.find_by id: params[:id]
  end

end
