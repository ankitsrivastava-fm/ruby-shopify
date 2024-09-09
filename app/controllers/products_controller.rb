class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = @store.products
  end

  def new
    @product = @store.products.new
  end

  def create
    @product = @store.products.new(product_params)
    @product.tenant = current_user.tenant

    if @product.save
      redirect_to store_product_path(@store, @product), notice: 'Product created successfully.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to store_product_path(@store, @product), notice: 'Product updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to store_products_path(@store), notice: 'Product deleted successfully.'
  end

  private

  def set_store
    @store = current_user.store
  end

  def set_product
    @product = @store.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image)
  end
end
