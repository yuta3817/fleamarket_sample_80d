Rails.application.routes.draw do

  devise_for :users
  # マークアップ画面の確認のため現状仮のルーティングを行っている
  root to: 'items#index'
  resources :items, only: :new
  get 'items/confirm/:id', to: 'items#confirm'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
