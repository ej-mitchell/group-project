Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users do
    resources :reviews, only: [:edit, :update, :destroy]
  end

  resources :books do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:index, :destroy]

  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
      resources :reviews, only: [:index, :show]
    end
  end
end
