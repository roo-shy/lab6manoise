class ManoisesController < ApplicationController

  before_action do
    @manoise = Manoise.order("created_at desc").page params[:page]
    authenticate_user
  end

  def create
    @manoise = Manoise.new params.require(:manoise).permit(:post)
    @manoise.user = @current.user
      if @manoise.save
        redirect_to dashboard_path, notice: "Make Some Manoise!"
      else
         render :dashboard
      end
  end
end
