class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :reviews
  has_many :products, through: :order
  has_many :products, through: :review
  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
