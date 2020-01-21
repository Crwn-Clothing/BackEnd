class Product < ApplicationRecord
  has_many :reviews
  has_many :orders
  has_many :carts, through: :orders
  has_many :users, through: :reviews
end
