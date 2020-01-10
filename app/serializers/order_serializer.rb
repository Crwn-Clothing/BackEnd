class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :token, :charge_id, :error_message, :customer_id, :payment_gateway
  has_one :product
  has_one :user
end
