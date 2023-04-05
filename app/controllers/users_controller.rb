class UsersController < ApplicationController

  skip_before_action :authorized_user, only: [:show, :create, :index]
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    render json: User.all, status: :ok
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
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
    params.permit(:username, :password, :password_confirmation)
  end

  def render_not_found_response
    render json: { errors: "Welcome to SoundScape, music will be assigned to you shortly." }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end