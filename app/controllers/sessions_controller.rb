class SessionsController < ApplicationController
  before_action :authorized_user, only: [:create]

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      render json: @user
    else
      render json: { errors: ['Invalid username or password'] }, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    head :no_content
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

  def authorized_user
    unless current_user
      render json: { errors: ['You need to log in first'] }, status: :unauthorized
    end
  end
end
