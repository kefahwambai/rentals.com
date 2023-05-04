class SessionsController < ApplicationController
  skip_before_action :authorized_user, only: :create

  def create
    access_token = request.env['omniauth.auth']
    user = User.create_from_omniauth(access_token)
  
    # Access token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save!
  
    user = User.find_by(username: params[:username])
    if user
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user
      else
        render json: { errors: ['Invalid username or password'] }, status: :unprocessable_entity
      end
    end
  
    # Create cookie after user is made
    cookies.encrypted[:current_user_id] = { value: user.id, expires: Time.now + 7.days }
  
    redirect_to root_path
  end
  
  def destroy
    session[:user_id] = nil
    head :no_content
  end

 
end