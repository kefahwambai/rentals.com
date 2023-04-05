class SessionsController < ApplicationController
  skip_before_action :authorized_user, only: :create

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to car_rentals_path
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    head :no_content
  end

  def session_params
    params.permit(:username, :password)
  end

end