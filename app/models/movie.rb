class Movie < ApplicationRecord
    
    has_many :movie_with_reviews, dependent: :destroy
    has_many :reviews, through: :movie_with_reviews

    validates :name, :image, :rating, :description, presence: true, uniqueness: true

end
