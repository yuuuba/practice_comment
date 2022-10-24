Rails.application.routes.draw do
  root to: "pages#index"
  resources :posts
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  devise_for :users
  resources :users, only: [:show]
end
