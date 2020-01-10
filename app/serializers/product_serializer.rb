class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :imageUrl, :price, :stripe_name
end
