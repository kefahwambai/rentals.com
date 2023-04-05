class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authorized_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user
    unless current_user
      render json: { error: "You are not authorized to access this page." }, status: :unauthorized
    end
  end
end
