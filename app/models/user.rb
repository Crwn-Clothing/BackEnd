
class User < ApplicationRecord
  has_secure_password
  has_many :carts
  has_many :reviews
  has_many :products, through: :orders
  has_many :products, through: :reviews
  has_many :orders, through: :carts
  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
