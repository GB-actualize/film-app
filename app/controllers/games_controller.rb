class GamesController < ApplicationController

  def index
    @games = Game.all
  
    @activated_games = @games.where("status = ?", "Activated")
    @completed_games = @games.where("status = ?", "Completed")
    
  end

  def create
    @game = Game.create(user_id: params[:user_id],
                          status: params[:status],
                          search: params[:search])

    @game.make_nodes

    redirect_to "/games/#{@game.id}"
  end


  def show
   
    @game = Game.find(params[:id])
    
    @nodes = @game.all_nodes
    @next_node = @game.find_next
    @jpeg_id = @game.jpeg_id
    @next_node_poster = @game.poster(@jpeg_id)

    
    @movie_object = @game.random_movie
    @random_jpeg_id = @game.random_jpeg_id(@movie_object)
    
    @random_movie_title = @game.random_movie_title(@movie_object)
    @random_movie_poster = @game.random_movie_poster(@random_jpeg_id)

    # @movie_nodes = @game.all_nodes
    # movie_node_titles = @movie_nodes.map { |node| node.title }
    # unused_movies = Movie.all.map(&:title) - movie_node_titles
    # @incorrect_movies = unused_movies.sample 2
  end


  def new

  end

  def update
    @game = Game.find(params[:id])
    if @game.update_node
      redirect_to "/games/#{@game.id}"
    else
      @game.end_game
      redirect_to "/games"
    end
  end
end
