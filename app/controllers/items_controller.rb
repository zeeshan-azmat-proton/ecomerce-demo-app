class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:category)
  end


  def new
    @item = Item.new
    @categories = Category.all
  end


  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to @item
    else
      @categories = Category.all
      render 'new'
    end
  end


  def show
    @item = Item.find(params[:id])
  end



  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
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
 