class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :require_user

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to new_user_path
    end
  end
end
