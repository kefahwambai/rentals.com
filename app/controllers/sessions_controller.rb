class SessionsController < ApplicationController
  skip_before_action :authorized_user, only: :create

  def create
    # Use find_by instead of find_by! to avoid exposing information about internal workings
    user = User.find_by(username: params[:username])
    if user&.authenticate(secure_password)
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      render json: { errors: 'Invalid password or username' }, status: :unauthorized
    end
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
      head :no_content
    end
  end

  private

  def secure_password
    # Encrypt password before it is sent over the network
    BCrypt::Password.create(params[:password]) 
  end
end
