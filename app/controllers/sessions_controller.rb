class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
       session[:user_id] = @user.id
       redirect_to '/'
    else
      # flash.now[:alert] = " didnt work"
      #  redirect_to '/signup', notice: "didnt work"
       format.html { redirect_to '/signup', notice: 'Tweet was successfully destroyed.' }
      format.json { render json: @user.errors, status: :unprocessable_entity  }
      
    end
 end
 
 def destroy

  session[:user_id] = nil
  redirect_to '/', notice: "Logged out!"
end
end
