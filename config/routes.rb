Rails.application.routes.draw do
  get '/movies' => 'movies#index'
  get '/movies/:id' => 'movies#show'
  get '/movies/new' => 'movies#new'
  post '/movies' => 'movies#create'
  get '/movies/:id/edit' => 'movies#edit'
  patch '/movies/:id' => 'movies#update'
  delete '/movies/:id' => 'movies#destroy'

  get '/games' => 'games#index'

  get '/movie_nodes' => 'movie_nodes#index'
  get '/movie_nodes/:id' => 'movie_nodes#show'

  get '/games' => 'games#index'
  get '/games/new' => 'games#new'
  get '/games/:id' => 'games#show'
  post '/games' => 'games#create'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy'

end
