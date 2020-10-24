class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:confirm]
  before_action :move_to_login, only: [:confirm]

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
    @address = Address.find_by(user_id: current_user.id)
    render layout: "sub_layout"
  end

  def move_to_login
    unless user_signed_in?
      redirect_to action: :index  #仮でindexにしているが実際はユーザー登録画面に飛ばす
    end
  end
end
