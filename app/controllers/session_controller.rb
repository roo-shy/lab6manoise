class SessionController < ApplicationController
  def new
  end

  def create
    username =params[:username]
    password = params[:password]

    user = User.find_by username: username
     if user && user.authenticate(password)
       session[:user_id] = user.id
       redirect_to dashboard_path
     else
       render :new
       flash.now[:alert] = "Please try again"
     end
  end

  def delete
     session.delete :user_id
     redirect_to root_path, notice: "You're signed out"
  end

end
