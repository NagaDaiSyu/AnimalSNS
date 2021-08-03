Rails.application.routes.draw do
  root 'home#index'
  # get 'application/set_search' => 'application#set_search'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    collection do
      get :tags
      get :search
    end
    resource :likes, only: [:create,:destroy]
  end
  resources :users, only: [:show, :index]
  resources :posts, only: [:new, :index, :edit, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
