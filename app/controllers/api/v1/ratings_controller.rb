class Api::V1::RatingsController < ApplicationController
    def create
        rating = Rating.new(rating_params)
   
        if rating.save
            AverageRatingCreator.new(params[:rating][:user_id], params[:rating][:rater_id]).call
            render json: rating, status: :created
        else
            render json: rating.errors, status: :unprocessable_entity
        end
    end

    private
    
    def rating_params
        params.require(:rating).permit(:user_id, :rater_id, :rating)
    end
end