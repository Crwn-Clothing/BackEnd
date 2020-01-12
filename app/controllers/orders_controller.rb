class OrdersController < ApplicationController
  before_action :set_orders, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = Order.create(order_params)
    render json: @order
  end

  def update
    @order.update(order_params)
  end

  def destroy
    @order.destroy
  end
  private

  def set_orders
    @order = Order.find_by(params[:id])
  end

  def order_params
    params.permit(:product_id, :user_id)
  end
end
