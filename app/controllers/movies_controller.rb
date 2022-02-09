class MoviesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
before_action :find_movie, only: [:show, :edit, :update, :destroy]

    def new
        movie = current_user.movies.new!
    end

    def index
        movies = Movie.all
        render json: movies, include: ['review', 'review.user']
    end

    def show
        movie = find_movie
        render json: movie, include: ['reviewer.user']
    end

    def create
        movie = current_user.movies.create!(movie_params)
        render json: movie, status: :created
    end

    def update
        movie = Movie..find_by_id(params[:id])

        if movie
            if movie.update(movie_params)
            render json: movie, status: :ok
            else
                render json: {error: movie.errors.full_messages}
            end
        else
            render json: {error: "Thismovie does not exist"}, status: :not_found
        end
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
