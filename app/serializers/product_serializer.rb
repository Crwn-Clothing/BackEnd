class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :name, :imageUrl, :price_cents, :gender
end
