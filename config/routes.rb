Rails.application.routes.draw do
  resources :movies, only: :index
  resources :seasons, only: :index
  resources :visual_contents, only: :index
  resources :users, only: [] do
    resources :purchased_contents, only: :index
    resources :purchases, only: :create
  end
end
