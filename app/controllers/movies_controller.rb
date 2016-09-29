class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
  end

  def create
    @movie = Movie.create(title: params[:title],
                          cast: params[:cast])
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
