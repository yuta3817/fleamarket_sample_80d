Rails.application.routes.draw do

  # マークアップ画面の確認のため現状仮のルーティングを行っている
  root 'items#show'
  get 'confirm', to: 'items#confirm'
  get 'listing', to: 'items#listing'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
