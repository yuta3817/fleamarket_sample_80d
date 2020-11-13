Rails.application.routes.draw do

  devise_for :users
  root to: 'items#index'
  
  resources :products, only:[:index, :new, :create, :edit, :update ,:destory]
  
  resources :items, only: [:new ,:show] do
    collection do
      get 'confirm/:id', to: 'items#confirm'
      post 'confirm/:id', to: 'items#pay'
      get 'completion/:id', to: 'items#completion'
      get 'mypage/:id', to: 'items#mypage'
      get 'logout', to: 'items#logout'
    end
  end
  
  resources :card, only: [:new, :create, :edit, :update, :destroy]
end
