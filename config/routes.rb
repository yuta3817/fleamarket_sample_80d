Rails.application.routes.draw do

  # マークアップ画面の確認のため現状仮のルーティングを行っている
  root to: 'items#show'
  resources :items, only: :new
  get 'items/confirm', to: 'items#confirm'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
