
class CartsController < ApplicationController
  before_action :set_carts, only: [:show, :update, :destroy]

  def index
    @cart = Cart.all
    render json: @cart
  end

  def show
    render json: @cart
  end

  def create
    @cart = Cart.create(user_id: params[:cart][:user_id], price: params[:cart][:price])
    order_array = []
    params[:products].each do |product|
      @order = Order.create(cart_id: @cart.id, product_id: product["id"])
      order_array << @order
    end

    # byebug

    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    charge = Stripe::Charge.create(
      :amount => (@cart.price * 100).to_i,
      :description => "Crwn Clothing",
      :currency => "usd",
      :source => params[:token],
    )

    begin
      puts charge
    rescue Stripe::CardError => e
      flash[:errors] = e.message
      render json: { error: "Didn't work" }
    end
    render json: { cart: @cart.as_json(include: [:products]), orders: order_array }
  end

  def update
    # @cart.update(carts_params)
  end

  def destroy
    @cart.destroy
  end

  private

  def set_carts
    @cart = Cart.find(params[:id])
  end

  # def carts_params
  #   params.permit(:user_id)
  # end
end
