Rails.application.routes.draw do
  resources :challenges
  namespace :api do
    namespace :v1 do
    resources :songs
    resources :games
    resources :radios
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
