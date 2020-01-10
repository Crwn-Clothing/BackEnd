class OrdersController < ApplicationController
  before_action :set_orders, only: [:show, :update, :destroy]
 

  def index
    @orders = Order.all
    # products = Product.all
    # @product_purchase = products.where(stripe_plan_name:)
    # @products_subscription = products - @products_purchase
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = Order.create(order_params)
    render json: @order
  end

  # enum status: { pending: 0, failed: 1, paid: 2, paypal_executed: 3 }
  # enum payment_gateway: { stripe: 0, paypal: 1 }
  # belongs_to :product
  # belongs_to :user

  # scope :recently_created, -> { where(created_at: 1.minutes.ago..DateTime.now) }

  # def set_paid
  #   self.status = Order.statuses[:paid]
  # end

  # def set_failed
  #   self.status = Order.statuses[:failed]
  # end

  # # def set_paypal_executed
  # #   self.status = Order.statuses[:paypal_executed]
  # # end

  private

  def set_orders
    @order = Order.find_by(params[:id])
  end

  def order_params
    params.permit(:product_id, :user_id)
  end
end
