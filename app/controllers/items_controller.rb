class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:category)
  end


  def new
    @item = Item.new
  end


  def create
    @item = Item.new(params[:item])
    @item.save
    redirect_to @item
  end


  def show
    @item = Item.find(params[:id])
  end



  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to @item
    else
      render 'edit'
    end
  end


  def destroy
    @item = Item.find(params[:id])

    @item.destroy
    redirect_to items_path
  end

end
 