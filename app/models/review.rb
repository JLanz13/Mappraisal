class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :time, inclusion: 0..23
end
