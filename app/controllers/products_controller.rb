class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

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
      # 保存失敗時に画像入力欄をひとつにする処理
      @product.product_images = []
      @product.product_images.new
      render action: :new, layout: "sub_layout"
    end
  end

  def update
  end

  def destory
  end


  private

  def product_params
    params.require(:product).permit(:name,
                                    :detail,
                                    :category_id,
                                    :brand_id,
                                    :status_id,
                                    :delivery_charge,
                                    :prefecture_id,
                                    :delivery_date,
                                    :price,
                                    product_images_attributes: [:image]
                                    ).merge(user_id: current_user.id)
  end
end
