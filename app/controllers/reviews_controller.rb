class ReviewsController < ApplicationController

    
    def index
      review = Review.all.order(rating: :desc)
      render json: review
    end
        
  
    def show
        review = Review.find(params[:id])
        render json: review
    end

    def create 
        review = Review.create(review_params)
        render json: review
    end

    def update
        review = Review.find(params[:id])
        if review.update(review_params)
            render json: review
        else
            render json: { error: review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        review = Review.find(params[:id])
        if review.destroy
            render json: { message: "Review deleted successfully" }
        else
            render json: { error: "Failed to delete review" }, status: :unprocessable_entity
        end
    end

    private

    def review_params
        params.require(:review).permit(:username, :comment, :rating, :blog_id)
    end


  end