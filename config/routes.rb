Rails.application.routes.draw do 
  resources :genres
  
  root "movies#index"
  
  resources :movies do
    resources :reviews
    resources :favorites , only: [ :create , :destroy ]
  end

  resources :users
  get "signup" => "users#new"

  resources :sessions , only: [:new , :create, :destroy]

  get "movies/filter/:filter" => "movies#index"
end
