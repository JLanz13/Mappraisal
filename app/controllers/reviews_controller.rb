class ReviewsController < ApplicationController

    # def index
    #     render json: Review.all
    # end

    def create
        review = Review.create!(review_params)
        render json: review.movie, status: :created
    end

    private

    def review_params
        params.permit(:time, :review_id, :movie_id)
    end

    # def find_review
    #     Activity.find(params[:id])
    # end

    # def record_not_found
    #     render json: {error: "Review not found"}, status: :not_found
    # end
end
