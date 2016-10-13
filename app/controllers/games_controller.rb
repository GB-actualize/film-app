class GamesController < ApplicationController
  def index
    @games = Game.all
  end

    def create
    @game = Game.create(user_id: params[:user_id],
                        status: params[:status])

    @movie_node = MovieNode.create(nodable_id: @game.id,
                                  nodable_type: "Game")

    5.times do 
      @movie = Movie.all.sample
      generated_array.push(@movie)
      
      @movie_node = MovieNode.create(nodable_id: @game.id,
                                    nodable_type: "MovieNode",
                                    title: @movie.title)



      # @generated_array << movie_node
      # # p "********************************"
      # # p "********************************"
      # # p @generated_array
      # # p "********************************"
      # # p "********************************"
    end
    redirect_to '/games'
  end


  def show
    @films = []
    @game = Game.find(params[:id])
    @movie_nodes = MovieNode.where("nodable_id = ?", @game.id)
    @films.push(@movie_nodes)
    @films
    
    @movies = Movie.all

    @movie_nodes_user1 = @movie_nodes[1].title
    @movie_nodes_user2 = @movie_nodes[5].title
  end


  def new
  end

end
