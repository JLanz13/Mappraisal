class ReviewsController < ApplicationController

    def index
        render json: Review.all
    end

    private

    def find_review
        Activity.find(params[:id])
    end

    def record_not_found
        render json: {error: "Review not found"}, status: :not_found
    end
end
