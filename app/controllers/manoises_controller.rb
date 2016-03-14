class ManoisesController < ApplicationController

  before_action do

    @manoise = Manoise.order("created_at desc").page params[:page]
    authenticate_user
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
  

  def index
    @manoise = Manoise.all
  end
end
