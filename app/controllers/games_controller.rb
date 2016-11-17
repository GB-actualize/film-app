class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = Game.all
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
      flash[:warning] = "Game could not be made, please try another search term."
      @game.destroy
      redirect_to "/games"
    end
      
  end


  def show
      @game = Game.find(params[:id])
      @nodes = @game.all_nodes
      @current_node = @game.current_correct_answer
      @next_node = @game.next_right_answer
      @current_node_info = @game.db_movie(@current_node.title)



      if @next_node
      @movie_node = MovieNode.find(@next_node)
      @previous_movie_poster = @game.db_poster_path(@current_node.poster_id)
  
      @posters = []

      random_movies = @game.random_movie.sample(5)

      random_movies.each do |random_movie|
        @posters << {right: false, poster: @game.db_poster_path(random_movie.id)}
      end

      @posters << {right: true, poster: @game.db_poster_path(@next_node.poster_id)}
      @posters.shuffle!


    else
      redirect_to "/games"
      @game.end_game
      flash[:success] = "You won!"

    end    
  end

  def update
    @game = Game.find(params[:id])
    @game.end_game
    redirect_to "/games"
  end
end
