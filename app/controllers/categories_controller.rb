class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.save
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.delete
      redirect_to categories_path
    else
      render category_path(@category)
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end