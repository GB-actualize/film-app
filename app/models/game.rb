class Game < ApplicationRecord
  belongs_to :user
  has_one :movie_node, as: :nodable

#api request methods

  def db_movie
    Tmdb::Search.movie("#{search}", include_adult: false)['results'][0]
  end

  def db_cast(movie_id)
    Tmdb::Movie.cast("#{movie_id}")
  end

  def db_next_movies(cast_id)
    Tmdb::Person.movie_credits("#{cast_id}")['cast']
  end

  def db_movie_path(movie_name)
    Tmdb::Search.movie("#{movie_name}")['results'][0]['id']
  end

  def db_poster_path(movie_id)
    Tmdb::Movie.posters("#{movie_id}").first.file_path
  end

#node creation methods

  def make_nodes
      movie = db_movie
      movie_id = movie["id"]
      actor = db_cast(movie["id"]).sample
      movie_node = MovieNode.create(nodable_id: id,
                                    nodable_type: "Game",
                                    title: movie["title"],
                                    movie_id: movie_id,
                                    correct: true,
                                    connection_name: actor["id"])
      count = 0
      5.times do 
        movie_options = db_next_movies(movie_node.connection_name) 
        until movie["title"] != movie_node.title || count >= 10
          movie = movie_options.sample 
          count += 1
        end

        movie_id = movie["id"]
        actor_options = db_cast(movie_id)
        count = 0
        until actor["id"] != movie_node.connection_name || count >= 10
          actor = actor_options.sample 
          count += 1
        end
        movie_node = MovieNode.create(nodable_id: movie_node.id,
                                      nodable_type: "MovieNode",
                                      title: movie["title"],
                                      movie_id: movie_id,
                                      connection_name: actor["id"])
    end
  end

  def all_nodes
    nodes = []
    current_node = MovieNode.find_by(nodable_id: id, nodable_type: "Game")
    nodes << current_node
    5.times do 
      current_node = MovieNode.find_by(nodable_id: current_node.id, nodable_type: "MovieNode")
      nodes << current_node
    end
    nodes
  end


  def find_next
    all_nodes.find { |node| node.correct == false }
  end
  
  def update_node
    if find_next
      find_next.update(correct: true)
    else 
      false
    end
  end

#poster api request methods
  
  def jpeg_id
    db_poster_path("#{find_next.movie_id}")
  end

  def poster(jpeg_id)
    config = Tmdb::Configuration.get
    base_url = config.images.base_url
    size = config.images.poster_sizes[3]
    "#{base_url}#{size}#{jpeg_id}"
  end

  def random_movie
    movie_object = Tmdb::Movie.top_rated.results.sample
  end

  def number_sampler
    (1..10).to_a.sample.to_i
  end
  
  def random_jpeg_id(movie_object)
    movie_object.poster_path
  end

  def random_movie_title(movie_object)
    movie_object.title
  end

  def random_movie_poster(random_jpeg_id)
    config = Tmdb::Configuration.get
    base_url = config.images.base_url
    size = config.images.poster_sizes[3]
    "#{base_url}#{size}#{random_jpeg_id}"
  end

  def end_game 
    update(status: "Completed")
  end

end
