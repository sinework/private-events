class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/'
    else
       redirect_to '/login', notice: "didnt work"
    end
 end
 
 def destroy
  session.delete(:user_id)
  # session[:user_id] = nil
  redirect_to '/', notice: "Logged out!"
end
end
