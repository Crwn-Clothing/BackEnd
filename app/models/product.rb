class Product < ApplicationRecord
  # monetize :price_cents
  has_many :orders
  has_many :reviews
  has_many :users, through: :order
  has_many :users, through: :review
end
