Rails.application.routes.draw do

  devise_for :users
  # マークアップ画面の確認のため現状仮のルーティングを行っている
  root to: 'items#index'
  
  resources :products, only:[:index, :new, :create, :edit, :update ,:destory]
  
  resources :items do
    collection do
      get 'confirm'
      get 'mypage'
      get 'logout'
    end
  end
end
