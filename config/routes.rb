Rails.application.routes.draw do

  resources :artists do 
    resources :songs, only:[:show, :index, :new]
  end 

  resources :songs, only: [:index, :show, :new]
end
