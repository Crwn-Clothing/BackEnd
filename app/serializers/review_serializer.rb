class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating
  has_one :user
  has_one :product
end
