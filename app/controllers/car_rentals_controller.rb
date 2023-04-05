class CarRentalsController < ApplicationController

    def index
        rentals = CarRental.all 
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
        rental.destroy
        head :no_content
    end

    private

    def carrental_params
        params.permit(:image_url, :carmake, :carmodel, :price, :description, :fuel)
    end

end

