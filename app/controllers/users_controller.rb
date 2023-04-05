class UsersController < ApplicationController

  before_action :set_csrf_token, only: [:new, :edit]
  
  def create
    user = User.new(user_params)
    
    if user.save
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end     

  def index
    users = User.all
    render json: users
  end
  
  def show
      @user = current_user
      render json: @user
  end
  
  def update
    user= User.find(params[:id])
    if user.update(user_params)
        render json: user
    else
        render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

    
  
  def destroy
    user = User.find(params[:id])
      if user.destroy
        render json: { message: "User deleted successfully" }
    else
        render json: { error: "Failed to delete user!" }, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

  def set_csrf_token
    @csrf_token = form_authenticity_token
  end  
   
end
  