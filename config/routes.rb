Rails.application.routes.draw do
  # root 'items#index'
  root 'items#show'
  get 'confirm', to: 'items#confirm'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
