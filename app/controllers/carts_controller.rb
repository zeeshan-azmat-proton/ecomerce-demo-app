class CartsController < ApplicationController
  def index
    @orders = Cart.includes(:user)
  end

  def new
    
  end

  def confirm
    @order = Cart.find(params[:id])
    @order.update_attributes(:status => "confirmed")
    redirect_to action: :index 
  end

  def checkout
    @cart_items = CartItem.where("user_id = #{current_user.id}").includes(:item)

    if @cart_items.present?
      total_bill = 0
      @cart_items.each do |cart_item|
        total_bill = total_bill + cart_item.item.price
        cart_item.destroy
      end

      @cart = Cart.new
        @cart.user_id = current_user.id
        @cart.bill = total_bill
      @cart.save

      redirect_to items_url
    else
      flash[:error] = "Cart is empty."
      redirect_to cart_items_url
    end
  end

  def previous_orders
    @orders = Cart.where("user_id = #{current_user.id}")
  end
end
