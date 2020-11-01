class ItemsController < ApplicationController
  require 'payjp'

  before_action :authenticate_user!, only: [:confirm, :pay]
  before_action :move_to_login, only: [:confirm, :pay]
  before_action :listing_user?, only: [:confirm]
  before_action :has_card?, only: [:pay]

  def index
  end
  
  def show
  end
  
  def new
    render layout: "sub_layout"
  end
  
  def confirm
    @product = Product.find_by(id: params[:id])
    @amount = @product.price + @product.delivery_charge
    @product_image = ProductImage.find_by(product_id: params[:id])
    @purchased = ProductPurchase.find_by(product_id: params[:id])
    @address = Address.find_by(user_id: current_user.id)
    if @card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
    render layout: "sub_layout"
  end

  def pay
    @product = Product.find_by(id: params[:id])
    amount = @product.price + @product.delivery_charge
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: amount,
      currency: 'jpy',
      customer: @card.customer_id
    )
    @purchased = ProductPurchase.new(
      user_id: current_user.id,
      product_id: @product.id
    )
    if @purchased.save
      redirect_to action: :completion, id: @product.id
    else
      render :confirm
    end
  end

  def completion
    @product = Product.find_by(id: params[:id])
    @product_image = ProductImage.find_by(product_id: params[:id])
    @amount = @product.price + @product.delivery_charge

  end

  # ログインしていないユーザーをユーザー登録画面へ飛ばす
  def move_to_login
    redirect_to action: :index unless user_signed_in?  # 仮でindexにしているが実際はユーザー登録画面に飛ばす
  end

  # 自分の出品した商品の購入確認ページにはアクセスできないようにする
  def listing_user?
    @product = Product.find_by(id: params[:id])
    if current_user.id == @product.user_id
      redirect_to action: :index
    end
  end

  def has_card?
    render :confirm unless @card = Card.find_by(user_id: current_user.id)
  end

end
