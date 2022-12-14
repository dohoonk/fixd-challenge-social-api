Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :posts, only: [:create, :show]
      resources :comments, only: [:create, :destroy]
      resources :ratings, only: [:create]
      resources :feeds, only: :show
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
