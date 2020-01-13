class OrderSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :product
  # belongs_to :user
end
