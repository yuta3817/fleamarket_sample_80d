Rails.application.routes.draw do

  # マークアップ画面の確認のため現状仮のルーティングを行っている
  root to: 'items#index'
  resources :items, only: [:new ,:show]
  get 'items/confirm', to: 'items#confirm'

end
