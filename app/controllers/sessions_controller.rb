class SessionsController < ApplicationController
  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
    @user = current_user
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"/
  end
end