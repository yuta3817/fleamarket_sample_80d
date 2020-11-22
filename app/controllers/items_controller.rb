class ItemsController < ApplicationController
  require 'payjp'

  before_action :authenticate_user!, except: [:index, :show, :logout]
  before_action :move_to_login, only: [:confirm, :pay, :completion, :mypage]
  before_action :listing_user?, only: [:confirm, :pay]
  before_action :has_card?, only: [:pay]
  before_action :move_to_index, except: [:index, :show, :logout]

  def index
    @products = Product.all.order("created_at DESC").first(5)
  end

  def mypage
    @user = User.find(params[:id])
    redirect_to root_path if @user.id != current_user.id
    @address = Address.find_by(user_id: params[:id])
    if @card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
  end
  
  def show
  end
  
  def confirm
    @product = Product.find(params[:id])
    @amount = @product.price + @product.delivery_charge
    @product_image = ProductImage.find_by(product_id: params[:id])
    @purchased = ProductPurchase.find_by(product_id: params[:id])
    @address = Address.find_by(user_id: current_user.id)
    if @card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
  end

  def logout
  end

  def pay
    @product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
    @product_image = ProductImage.find_by(product_id: params[:id])
    @amount = @product.price + @product.delivery_charge
  end
  
  private
  # ログインしていないユーザーをユーザー登録画面へ飛ばす
  def move_to_login
    redirect_to action: :index unless user_signed_in?  # 仮でindexにしているが実際はユーザー登録画面に飛ばす
  end

  # 自分の出品した商品の購入確認ページにはアクセスできないようにする
  def listing_user?
    @product = Product.find(params[:id])
    if current_user.id == @product.user_id
      redirect_to action: :index
    end
  end

  def has_card?
    render :confirm unless @card = Card.find_by(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
