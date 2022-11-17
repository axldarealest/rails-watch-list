Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'lists#index'

  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]

  # resources :bookmark, only: [:index, :new, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
