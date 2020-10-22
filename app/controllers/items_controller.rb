class ItemsController < ApplicationController
  def index
  end
  
  def show
  end
  
  def new
    render layout: "sub_layout"
  end
  
  def confirm
    @product = Product.find_by(id: params[:id])
    @product_image = ProductImage.find_by(product_id: params[:id])
    @address = Address.find_by(user_id: 1)  #devise実装後current_userに変える
    render layout: "sub_layout"
  end
end
