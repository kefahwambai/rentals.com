class ApplicationController < ActionController::Base
    after_action :set_access_control_headers

    def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = 'https://rentalsapp.vercel.app'
    end
  
    protect_from_forgery with: :exception
    
    include ActionController::Cookies
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  