class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:name, :username, :password)
    end

    def record_not_found
        render json: {error: "User not found"}, status: :not_found
end
