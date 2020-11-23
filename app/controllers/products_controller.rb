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

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
