class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
      @game = Game.create(user_id: params[:user_id],
                          status: params[:status])

      @game.make_nodes

    redirect_to '/games'
  end


  def show

    @game = Game.find(params[:id])
    @movie_nodes = @game.all_nodes
    movie_node_titles = @movie_nodes.map { |node| node.title }
    unused_movies = Movie.all.map(&:title) - movie_node_titles
    @incorrect_movies = unused_movies.sample 2
  end


  def new
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_node
      redirect_to "/games/#{@game.id}"
    else
      @game.update("status" => "Completed")
      redirect_to "/games"
    end
  end
end
