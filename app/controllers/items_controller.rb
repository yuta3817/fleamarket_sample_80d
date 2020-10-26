class ItemsController < ApplicationController
  require 'payjp'

  before_action :authenticate_user!, only: [:confirm]
  before_action :move_to_login, only: [:confirm]
  before_action :listing_user, only: [:confirm]

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
    if Card.find_by(user_id: current_user.id)
      @card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
    render layout: "sub_layout"
  end

  # ログインしていないユーザーをユーザー登録画面へ飛ばす
  def move_to_login
    unless user_signed_in?
      redirect_to action: :index  #仮でindexにしているが実際はユーザー登録画面に飛ばす
    end
  end

  # 自分の出品した商品の購入確認ページにはアクセスできないようにする
  def listing_user
    @product = Product.find_by(id: params[:id])
    if current_user.id == @product.user_id
      redirect_to action: :index
    end
  end

end
