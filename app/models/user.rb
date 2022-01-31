class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews

    validates :name, presence: true
    validates :password, presence: true
end
