class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
     product = Product.new(product_params)
     if product.save
       flash[:notice] = "Successfully created product"
       redirect_to product_path(product)
     else
       flash[:error] = product.errors.full_messages.join(', ')
       redirect_to new_product_path
     end
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def update
    product = Product.find_by_id(params[:id])
    product.update_attributes(product_params)
    if product.save
      flash[:notice] = "Successfully created product"
      redirect_to product_path(product)
    else
      flash[:error] = product.errors.full_messages.join(', ')
      redirect_to edit_product_path
    end
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    @product.destroy
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category, :sku, :wholesale, :retail)
  end
end
