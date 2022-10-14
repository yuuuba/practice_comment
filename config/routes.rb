Rails.application.routes.draw do
  root to: "pages#index"
  get 'pages/index'
  get 'pages/show'
  devise_for :users
end
