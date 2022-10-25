Rails.application.routes.draw do
  root to: "pages#index"
  resources :posts
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  # 大事なのはここです！
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # マイページのルーティング
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  #resources :users, only: [:show]
end
