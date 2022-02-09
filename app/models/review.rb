class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"

  has_many :movie_with_reviews
  has_many :movies, through: :movie_with_reviews
  
  validates :text, presence: true
end
