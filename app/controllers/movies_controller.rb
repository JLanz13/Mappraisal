class MoviesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def index
        movies = Movie.all
        render json: movies
    end

    def show
        movie = find_movie
        render json: movie, serializer: MovieWithReviewSerializer
    end

    def create
        movie = Movie.create!(movie_params)
        render json: movie, status: :created
    end

    def destroy
        review = find_review
        review.destroy
    end

    private

    def find_movie
        Movie.find(params[:id])
    end

    def record_not_found
        render json: {error: "Movie not found"}, status: :not_found
    end

    def invalid_record(exception)
        render json: {errors: exception.record.errors.full_messages}, status: 422
    end

    def movie_params
        params.permit(:name, :description, :rating)
    end
end
