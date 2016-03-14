class FollowController < ApplicationController

  before_action :authenticate_user

  def create
    new_user = User.find params[:id]
    @current_user.follow new_user
    redirect_to dashboard_path, notice: "You have followed #{new_user.username}"
  end

  def delete
    new_user = User.find params[:id]
    @current_user.stop_follow new_user
    redirect_to dashboard_path, notice: "You have stopped following #{new_user.username}"
  end
end
