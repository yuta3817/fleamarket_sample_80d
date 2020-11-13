class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :mypage, :confirm, :logout]
  before_action :authenticate_user!, only: []

  def index
  end

  def mypage
  end
  
  def show
  end
  
  def confirm
  end

  def logout
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
