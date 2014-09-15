class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where("user_id = #{current_user.id}").includes(:item)
  end

  def add_to_cart
    @cart_item = CartItem.new

    @cart_item.user_id = current_user.id
    @cart_item.item_id = params[:id]
    
    @cart_item.save
    respond_to do |format|
      format.json { head :ok }
    end
    # return render json: {status: "success"}
    # redirect_to items_url
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
end
