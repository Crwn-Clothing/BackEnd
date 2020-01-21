class ChargesController < ApplicationController
  def create
    #
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    # params[:orderId].each do |order|
    #   byebug
    # end

    order = Order.find(params[:orderId])

    amount = order.product.sum(:price_cents) * 100

    charge = Stripe::Charge.create(
      :amount => amount,
      :description => "Crwn Clothing",
      :currency => "usd",
      :source => params[:token],
    )
    begin
      puts charge
    rescue Stripe::CardError => e
      flash[:errors] = e.message
      redirect_to charges_path
    end
  end

  private

  def get_key
    "sk_test_MCMCkf9sD2ui6wRETL9fzaDq00afWiekMb"
  end
end
