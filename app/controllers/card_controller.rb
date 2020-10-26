class CardController < ApplicationController
  require 'payjp'
  
  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "edit" if card.exists? # 仮でルートに飛ばしている
  end
  
  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp_token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card
      )
      if @card.save
        redirect_to :back
      else
        redirect_to action: "new"
      end
    end
  end

  def show
  end

end
