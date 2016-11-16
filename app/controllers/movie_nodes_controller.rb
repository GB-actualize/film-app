class MovieNodesController < ApplicationController

  def update
    @movie_node = MovieNode.find(params[:id])
    @game = Game.find( @movie_node.nodable_id )
    
    @movie_node.update_node
    redirect_to "/games/#{@game.id}"
  end
end
