class ItemsController < ApplicationController
  def index
  end
  
  def show
  end
  
  def new
    render layout: "sub_layout"
  end
  
  def confirm
    @product = Product.find_by(id: 1)
    render layout: "sub_layout"
  end
end
