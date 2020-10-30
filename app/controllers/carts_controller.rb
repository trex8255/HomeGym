class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = current_user.carts

    @product_price=0
    @carts.each do |cart|
    @product_price+=cart.pack.price*cart.quantity
    end
    if @product_price > 500
        @shipping_fee = 0
    else
        @shipping_fee = 80
    end
    @total_price=@product_price+@shipping_fee
  end

  def create
    cart = Cart.new(
      pack_id: params[:pack_id],
      user_id: current_user.id,
      quantity: params[:quantity]
    )
    
    cart.verified_save

    flash[:notice]="Successfully saved. Would you like to check it out?"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_back(fallback_location: root_path)
  end
end
