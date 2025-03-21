require "minitest/autorun"
require_relative "../../lib/flicks/movie"
require_relative "../../lib/flicks/playlist"
module Flicks
  class PlaylistTest < Minitest::Test

    def test_playlist_name_is_capitalized_when_created
      p = Playlist.new("endgame")
      assert_equal "Endgame", p.name
    end

    def test_movies_list_empty_when_created
      p = Playlist.new("endgame")
      assert_empty p.movies
    end

    def test_movies_list_increased_when_added
      p = Playlist.new("endgame")
      movie_1 = Movie.new("A")
      movie_2 = Movie.new("B")
      p.add_movie(movie_1)
      p.add_movie(movie_2)
      assert_equal 2, p.movies.length
    end
  end
end