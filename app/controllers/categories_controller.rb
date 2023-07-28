class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/:id
  def show
    @category = Category.find(params[:id])
  end
end
