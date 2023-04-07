class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authorized_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorized_user
    render json: { error: 'You need to log in first' }, status: :unauthorized unless current_user
  end
end