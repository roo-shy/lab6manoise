class HomeController < ApplicationController
  before_action :authenticate_user, only: [:dashboard]

  def index
  end

  def dashboard
    @manoise = Manoise.new
    ids_of_my_followers = @current_user.following_users.pluck(:id)
    timeline = ids_of_my_followers << @current_user.id
    @manoises = Manoise.where(user_id: timeline).order("created_at DESC").page params[:page]

    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(20)
  
  end

  def create
    @manoise = Manoise.new params.require(:manoise).permit(:post)
    @manoise.user = @manoise_user
    if @manoise.save
     redirect_to dashboard_path
    else
     render :new
    end
  end

end
