Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :challenges
      resources :games
      resources :songs
      resources :radios
      resources :results
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
