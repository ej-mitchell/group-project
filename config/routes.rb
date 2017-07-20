Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users do
    resources :books, except: [:index, :show, :new, :create]
    resources :reviews, only: [:edit, :update, :destroy]
  end

  resources :books, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
    end
  end
end
