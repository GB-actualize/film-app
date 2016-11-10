class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    title = params[:title]
    @api_request = Unirest.get("http://www.omdbapi.com/?t=#{title}&y=&plot=full&r=json").body
   
    @second_api = Unirest.get("https://api.themoviedb.org/3/find/#{@imdb_id}?api_key=9482477efbb64d2d7c25d2509e8a6c51&language=en-US&external_source=imdb_id").body

    @omdb_id = @second_api["movie_results"][0]["id"]
    @credits = Unirest.get("https://api.themoviedb.org/3/movie/#{@omdb_id}/credits?api_key=9482477efbb64d2d7c25d2509e8a6c51").body

    @actor_id = @credits["cast"][0]["id"]



    @next_movie = @actor_credits["results"][0]["title"]





  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
  end

  def create
    title = params[:title]
    cast = params[:cast]
    

    redirect_to '/movies'
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(title: params[:title],
                  cast: params[:cast])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
  end
end
