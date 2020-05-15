Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
  # post "/users", to: "users#create"
  # patch "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
  # put "/users/:id", to: "users#update"
  # get "/users/new", to: "users#new", as: "new_user"
  # get "/users/:id/edit", to: "users#edit"
  resources :users do
    get "/artwork_shares", to: "artwork_shares#index"
    resources :artworks, only: :index
    resources :comments, only: :index
  end

  resources :artworks do
    resources :comments, only: :index
  end
  

  # get "/artworks", to: "artworks#index" # Do not need this 
  # get "/artworks/:id", to: "artworks#show"
  # post "/artworks", to: "artworks#create"
  # patch "/artworks/:id", to: "artworks#update"
  # delete "/artworks/:id", to: "artworks#destroy"
  # put "/artworks/:id", to: "artworks#update"
  # get "/artworks/new", to: "artworks#new", as: "new_artwork"
  # get "/artworks/:id/edit", to: "artworks#edit"

  # post "/artwork_shares", to: "artwork_shares#create"
  # delete "/artwork_shares/:id", to: "artwork_shares#destroy"
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]

end 
