class GamesController < ApplicationController
  before_action :authenticate_user!

  def index

    @activated_games = current_user.activated_games
    @completed_games = current_user.completed_games
    
  end

  def create
      
    
      @game = Game.create(user_id: current_user.id,
                          status: params[:status],
                          search: params[:search])
    
      if @game.make_nodes
        redirect_to "/games/#{@game.id}"
      else
        flash[:warning] = "game not made, try different movie"
        @game.destroy
        redirect_to "/games"
      end
      
  end


  def show
      @game = Game.find(params[:id])
      @nodes = @game.all_nodes
      @current_node = @game.current_correct_answer
      @next_node = @game.next_right_answer



      if @next_node
      @movie_node = MovieNode.find(@next_node)
      @previous_movie_poster = @game.db_poster_path(@current_node.poster_id)
  
      @posters = []

      random_movies = @game.random_movie.sample(4)

      random_movies.each do |random_movie|
          @posters << {right: false, poster: @game.db_poster_path(random_movie.id)}
        end
      @posters << {right: true, poster: @game.db_poster_path(@next_node.poster_id)}
      @posters.shuffle!


      else
        redirect_to "/games"
        flash[success] = "You won"
      end
      
      # # @jpeg_id = @game.jpeg_id
      # @next_node_poster = @game.poster(@movie_poster)

      # @movie_object = @game.random_movie
      # @random_jpeg_id = @game.random_jpeg_id(@movie_object)
      # @random_movie_title = @game.random_movie_title(@movie_object)
      # @random_movie_poster = @game.random_movie_poster(@random_jpeg_id)
      

      
   

    # @movie_nodes = @game.all_nodes
    # movie_node_titles = @movie_nodes.map { |node| node.title }
    # unused_movies = Movie.all.map(&:title) - movie_node_titles
    # @incorrect_movies = unused_movies.sample 2
  end


  def new

  end

  def update

  end
end
