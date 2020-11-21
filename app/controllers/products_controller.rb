class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :check_listing_user, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
    @product.product_images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      # 保存失敗時に画像入力欄をひとつにする処理
      @product.product_images = []
      @product.product_images.new
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:name,
                                    :detail,
                                    :category_id,
                                    :brand_id,
                                    :status_id,
                                    :charge_id,
                                    :prefecture_id,
                                    :delivery_id,
                                    :price,
                                    product_images_attributes: [:image, :_destroy, :id]
                                    ).merge(user_id: current_user.id)
  end

  def check_listing_user
    unless @product.user_id == current_user.id
      redirect_to root_path 
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
