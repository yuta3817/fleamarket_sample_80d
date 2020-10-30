class CardController < ApplicationController
  require 'payjp'

  before_action :move_to_login
  after_action :session_clear, only: [:create, :update]
  
  def new
    @title = "カード情報新規登録"
    @btn = "登録"
    session[:previous_url] = request.referer
    redirect_to "/" if Card.find_by(user_id: current_user.id)
  end
  
  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp_token'],
        metadata: { user_id: current_user.id }
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: params['card_token']
      )
      if @card.save
        redirect_to session[:previous_url]
      else
        render :new
      end
    end
  end

  def edit
    @title = "カード情報変更"
    @btn = "変更"
    @card = Card.find_by(id: params[:id])
    session[:previous_url] = request.referer
    redirect_to "/" if @card.nil? || @card.user_id != current_user.id
  end

  def update
    @card = Card.find_by(id: params[:id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    # 既存のカード情報を削除
    card = customer.cards.retrieve(@card.card_id)
    card.delete
    # カードを新しく登録
    customer.cards.create(
      card: params['payjp_token']
    )
    if @card.update(card_id: params['card_token'])
      redirect_to session[:previous_url]
    else
      render :edit
    end
  end

    # ログインしていないユーザーをユーザー登録画面へ飛ばす
  def move_to_login
    redirect_to "/" unless user_signed_in?
  end

  # セッションの開放
  def session_clear
    session[:previous_url].clear
  end
end
