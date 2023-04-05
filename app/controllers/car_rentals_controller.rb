class CarRentalsController < ApplicationController
    before_action :authorized_user
    
    def index
      rentals = CarRental.where(rented: false)
      render json: rentals
    end
  
    def show
      rentals = CarRental.find(params[:id])
      render json: rentals, include: :reviews
    end
  
    def create
      rentals = CarRental.create(carrental_params)
      render json: rentals 
    end
  
    def update
      rental = CarRental.find(params[:id])
      rental.update(carrental_params)
      render json: rental
    end
  
    def destroy
      rental = CarRental.find(params[:id])
      if rental.destroy
          render json: { message: "Car deleted successfully" }
      else
          render json: { error: "Failed to delete car!" }, status: :unprocessable_entity
      end
    end
  
    private
  
    def carrental_params
      params.permit(:image_url, :carmake, :carmodel, :price, :description, :fuel)
    end
  end
  