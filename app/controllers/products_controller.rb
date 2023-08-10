class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @products = Product.all.page(params[:page]).per(20)
    if params[:filter] == 'sale'
      @products = Product.on_sale.page(params[:page]).per(20)
    elsif params[:filter] == 'new'
      @products = Product.new_within_three_days.page(params[:page]).per(20)
    end
  end
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully destroyed.'
  end
  def search

    @categories = Category.all

    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"

      @products = Product.where('products.name LIKE :keyword OR products.description LIKE :keyword', keyword: keyword)
    else
      @products = Product.all
    end

    if params[:category_id].present?
      category_id = params[:category_id]

      @products = @products.joins(:categories).where('categories.id': category_id)
    end
  end

def update_sale_status
    @product = Product.find(params[:id])
    @product.update(on_sale: params[:on_sale], sale_price: (params[:on_sale] ? @product.price * 0.5 : nil))

    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :user_id, images: [])
  end


end
