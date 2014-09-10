class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    
  end

  def add_cart
    puts "-0----------------------------------------"
    cookies[:cart] = { :user_id => current_user.id, :item_id => params[:item_id], :expires => Time.now + 3600}
  end
end
