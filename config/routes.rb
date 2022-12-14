Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :participants
  end
  resources :events do
    resources :participants
    resources :draw
    get '/make', to: 'draws#make', as: 'make'
  end

  resources :wishlists do
    resources :items, only: [:new, :create]
  end
end
