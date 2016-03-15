class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user
    user_id = session[:user_id]
    @current_user = User.find_by id: user_id
      if @current_user.nil?
        redirect_to sign_in_path
      end
  end


  helper_method :user_signed_in?
    def user_signed_in?
      @current_user.present?
    end
end
