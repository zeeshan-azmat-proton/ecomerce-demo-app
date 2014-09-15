class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:category)
  end


  def new
    @item = Item.new
    @categories = Category.all
    authorize! :create, @item
  end


  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to action: :index
    else
      @categories = Category.all
      render 'new'
    end
  end


  def show
    @item = Item.find(params[:id])
    if params[:ajax]
      return render partial: 'add_to_cart', locals: { item: @item }
    end
  end


  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
    authorize! :update, @item
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to action: :index
    else
      render 'edit'
    end
  end


  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    authorize! :destroy, @item    
    redirect_to items_path
  end

end
 