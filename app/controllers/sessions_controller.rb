class SessionsController < ApplicationController
  skip_before_action :authorized_user, only: :create

  def create
      user = User.find_by(username: params[:username])
      if user
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user
      else
        render json: { errors: ['Invalid username or password'] }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    session[:user_id] = nil
    head :no_content
  end

 
end