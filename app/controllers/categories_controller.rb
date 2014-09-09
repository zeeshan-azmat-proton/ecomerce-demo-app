class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end


  def new
    @category = Category.new
    authorize! :create, @category
  end


  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end


  def show
    @category = Category.find(params[:id])
  end



  def edit
    @category = Category.find(params[:id])
    authorize! :update, @category
  end

  def update
    @category = Category.find(params[:id])
   
    if @category.update_attributes(params[:category])
      redirect_to @category
    else
      render 'edit'
    end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    authorize! :destroy, @category
    redirect_to categories_path
  end
   
end
