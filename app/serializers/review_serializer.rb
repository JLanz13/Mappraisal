class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :review

  belongs_to :reviewer
  has_many :movies

end
