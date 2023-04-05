Rails.application.routes.draw do
  resources :reviews
  resources :car_rentals
  resources :users

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'users#show'  
  get '/car_rentals/:car_rental_id/reviews', to: 'reviews#index'
  # match 'signup', to: 'cors#preflight', via: [:options]
  # match 'login', to: 'cors#preflight', via: [:options]

  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
