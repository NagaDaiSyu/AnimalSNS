Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'home#index'
  get 'home/help'
  # get '/posts/hashtag/:name' => 'posts#hashtag'
  # get '/posts/hashtag' => 'posts#hashtag'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    collection do
      get :tags
    end
  end
  resources :users, only: [:show, :index]
  resources :posts, only: [:new, :index, :create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
