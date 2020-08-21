Rails.application.routes.draw do
  resources :artists
  resources :songs

  resources :artists do
    resources :songs, only: [:show, :index]
  end

end
