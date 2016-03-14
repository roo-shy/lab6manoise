class ManoisesController < ApplicationController

  before_action do
    @manoise = Manoise.order("created_at desc").page params[:page]
    authenticate_user
  end

  def create
    if authenticate_user
      @post = Post.new post_params
      @post.user = current_user
      if @post.save
        redirect_to root_path, notice: 'Make Some Manoise!'
      else
        redirect_to :back, alert: 'Please Try Again'
      end
    end
  end
end
