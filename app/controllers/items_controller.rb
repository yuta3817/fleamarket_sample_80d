class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :confirm]

  def index
  end

  
  def show
  end
  
  def new
    render layout: "sub_layout"
  end
  
  def confirm
    render layout: "sub_layout"
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

