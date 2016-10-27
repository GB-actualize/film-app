class MovieNodesController < ApplicationController
  def index
    @movie_nodes = MovieNode.all
    title = params[:title]
    @api_request = Unirest.get("http://www.omdbapi.com/?t=#{title}&y=&plot=full&r=json").body
  end

  def show
    @movie_node = MovieNode.find(params[:id])

    
  end

  def new
  end

  def create
    @movie_node = MovieNode.create(title: params[:title],
                                  nodable_id: params[:nodable_id],
                                  nodable_type: params[:nodable_type],
                                  movie_id: params[:movie_id])
  end

end
