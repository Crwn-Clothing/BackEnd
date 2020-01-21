class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :name, :imageUrl, :price_cents, :gender
  has_many :orders
end
