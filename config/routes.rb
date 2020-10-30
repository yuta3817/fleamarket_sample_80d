Rails.application.routes.draw do

  devise_for :users

  root 'items#show'
  get 'confirm', to: 'items#confirm'

  resources :products, only:[:index, :new, :create]
end
