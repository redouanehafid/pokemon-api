Rails.application.routes.draw do
  #get 'pokemons#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  

  namespace :api do
    namespace :v1 do
      resources :pokemons, only: [:index, :create, :show, :update, :destroy]
    end
  end

  
end
