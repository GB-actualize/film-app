Rails.application.routes.draw do
  resources :movies, :movie_nodes, :games

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy'

end
