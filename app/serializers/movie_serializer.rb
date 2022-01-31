class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :rating
end
