class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else

      format.html { redirect_to '/signup', notice: '' }
      format.json { render json: @user.errors, status: :unprocessable_entity }

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: 'Logged out!'
  end
end
