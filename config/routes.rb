Rails.application.routes.draw do
  get '/movies' => 'movies#index'
  get '/movies/:id' => 'movies#show'
  get '/movies/new' => 'movies#new'
  post '/movies' => 'movies#create'
  get '/movies/:id/edit' => 'movies#edit'
  patch '/movies/:id' => 'movies#update'
  delete '/movies/:id' => 'movies#destroy'

  get '/games' => 'games#index'

  get '/movie_nodes/:id' => 'movie_nodes#show'
end
