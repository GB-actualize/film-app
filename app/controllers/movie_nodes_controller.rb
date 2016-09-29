class MovieNodesController < ApplicationController
  def show
    @movie_node = Movie_Node.find(params[:id])
  end
end
