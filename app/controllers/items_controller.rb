class ItemsController < ApplicationController
  def index
    @items = Item.includes(:category)
  end


  def new
  end

  def create
    @item = Item.new(params[:item])
    @item.save
    redirect_to @item
  end

  def show
    @item = Item.find(1)
  end
end
 