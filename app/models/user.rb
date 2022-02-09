class User < ApplicationRecord
    has_secure_password

    has_many :reviewed_movies, class_name: 'Review', foreign_key: 'reviewer_id', dependent: :nullify

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
