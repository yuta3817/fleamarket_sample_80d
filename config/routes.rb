Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  root to: 'items#index'
  
  resources :products, only:[:new, :create, :show, :edit, :update , :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
  resources :items, only:[:index] do
    collection do
      get 'confirm/:id', to: 'items#confirm'
      post 'confirm/:id', to: 'items#pay'
      get 'completion/:id', to: 'items#completion'
      get 'mypage/:id', to: 'items#mypage'
      get 'logout'
    end
  end
  resources :card, only: [:new, :create, :edit, :update, :destroy]
end
