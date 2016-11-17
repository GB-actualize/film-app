class Game < ApplicationRecord
  belongs_to :user
  has_one :movie_node, as: :nodable

  def all_nodes
    nodes = []
    current_node = MovieNode.find_by(nodable_id: id, nodable_type: "Game")

    nodes << current_node

    false_nodes = MovieNode.where(nodable_id: id, nodable_type: "MovieNode")
    false_nodes.each do |false_node|
      nodes << false_node
    end
    nodes
  end

  def next_right_answer
    all_nodes.select { |node| !node.correct }.first
  end

  def current_correct_answer
    all_nodes.select { |node| node.correct }.last
  end


  def self.reset_games
    not_first_nodes = MovieNode.where(nodable_type: "MovieNode")
    not_first_nodes.update_all(correct: false)
  end
  
  
  def update_node
    self.update(correct: true)
  end

  def end_game
    self.update(status: "Completed")
  end

  def self.reset_games
    not_first_nodes = MovieNode.where(nodable_type: "MovieNode")
    not_first_nodes.update_all(correct: false)
    all_games = Game.where(status: "Completed")
    all_games.update_all(status: "Activated")
  end

#poster api request methods

  def random_movie
    Tmdb::Movie.top_rated(page: (1..50).to_a.sample).results
  end

  def db_poster_path(poster_id)
    movie_poster = Tmdb::Movie.posters("#{poster_id}").first.file_path
    config = Tmdb::Configuration.get
    base_url = config.images.base_url
    size = config.images.poster_sizes[3]
    "#{base_url}#{size}#{movie_poster}"
  end

#node creation methods

  #api request methods

  def db_movie(search)
    Tmdb::Search.movie("#{search}", include_adult: false)['results'][0]
  end

  # def db_cast(movie_id)
  #   Tmdb::Movie.cast("#{movie_id}")
  # end

  # def db_next_movies(cast_id)
  #   Tmdb::Person.movie_credits("#{cast_id}")['cast']
  # end


  # def make_nodes
  #     movie = db_movie
  #     movie_id = movie["id"]
  #     actor = db_cast(movie["id"]).sample
  #     movie_node = MovieNode.create(nodable_id: id,
  #                                   nodable_type: "Game",
  #                                   title: movie["title"],
  #                                   movie_id: movie_id,
  #                                   correct: true,
  #                                   connection_name: actor["id"])
  #     movie_array = []
  #     actor_array = []
  #     movie_array << movie["title"]


  #     p "*********************************************"
  #     while movie_array.length < 3
  #       p movie_array 
  #       p actor_array
  #       movie_options = db_next_movies(movie_node.connection_name)
  #       popular_movies = movie_options[0..5]
  #       popular_movies.delete_if{|popular_movie| movie_array.include?(popular_movie["title"])}
  #       while popular_movies = 0
  #         actor_options = db_cast(movie_id)
  #         actor = actor_options.sample
  #         popular_movies = db_next_movies(actor["id"])[0..5].delete_if{|popular_movie| movie_array.include?(popular_movie["title"]) }
  #         actor_array << actor["id"]
  #       end

  #       movie_sample = popular_movies.sample
  #       movie_array << movie_sample["title"]
       
  #       movie_id = movie_sample["id"]
  #       actor_options = db_cast(movie_id)
  #       actor_options.delete_if{|actor_option| actor_array.include?(actor_option["id"])}
  #       actor = actor_options.sample
  #       actor_array << actor["id"]

  #       movie_node = MovieNode.new(nodable_id: movie_node.id,
  #                                     nodable_type: "MovieNode",
  #                                     title: movie_sample["title"],
  #                                     movie_id: movie_id,
  #                                     connection_name: actor["id"])
  #       unless movie_node.save
  #         return false
  #       end
  #     end

  #   true
  # end
end
