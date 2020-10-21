Rails.application.routes.draw do

  # マークアップ画面の確認のため現状仮のルーティングを行っている
  root 'items#show'
  get 'confirm', to: 'items#confirm'

  resources :products 
end
