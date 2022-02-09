class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :rating

  has_many :reviews

end
