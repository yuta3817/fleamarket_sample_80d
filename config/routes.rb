Rails.application.routes.draw do

  devise_for :users
  # マークアップ画面の確認のため現状仮のルーティングを行っている
  root to: 'items#index'
  
  resources :products, only:[:index, :new, :create, :edit, :update ,:destory]
  
  resources :items, only: [:new ,:show] do
    collection do
      get 'confirm'
    end
  end
end
