Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'home#index'
  get 'home/help'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users, only: [:show, :index]
  resources :posts, only: [:new, :index, :create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
