class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @product.product_images.new
    render layout: "sub_layout"
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
      
    end
  end

  def show

  end


  private

  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :brand_id, :status_id, :delivery_charge, :prefecture_id, :delivery_date, :price, product_images_attributes: [:image]).merge(user_id: 1)
  end
end
