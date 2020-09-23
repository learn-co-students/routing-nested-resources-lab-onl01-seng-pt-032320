Rails.application.routes.draw do
  resources :artists, only: [:show] do
    resources :songs, only: [:index,:show]
  end
  resources :songs
  resources :artists
end
