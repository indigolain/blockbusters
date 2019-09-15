Rails.application.routes.draw do
  resources :movies, only: :index
  resources :seasons, only: :index
  resources :visual_contents, only: :index
end
