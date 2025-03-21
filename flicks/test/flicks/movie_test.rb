require "minitest/autorun"
require_relative "../../lib/flicks/movie"
module Flicks
  class MovieTest < Minitest::Test
    
    ## Setup method called before each test run
    def setup
      ## This suppresses the std output from testing classes
      $stdout = StringIO.new
    end

    def test_has_capitalized_movie_title
      movie = Movie.new("goonies", 10)
      assert_equal "Goonies", movie.title
    end

    def test_has_initial_rank_assigned
      movie = Movie.new("goonies", 10)
      assert_equal 10, movie.rank
    end

    def test_has_thumbs_up_increases_rank
      movie = Movie.new("goonies", 10)
      movie.thumbs_up
      assert_equal 11, movie.rank
    end

    def test_has_thumbs_down_decreases_rank
      movie = Movie.new("goonies", 10)
      movie.thumbs_down
      assert_equal 9, movie.rank
    end

    def test_has_a_string_representation
      movie = Movie.new("goonies", 10)
      assert_equal "Goonies has a rank of 10", movie.to_s
    end

    def test_decreases_rank_for_low_number_roll
      movie = Movie.new("goonies", 10)
      movie.stub(:roll_die, 1) do
        movie.view
        assert_equal 9, movie.rank
      end
    end

    def test_increases_rank_for_high_number_roll
      movie = Movie.new("goonies", 10)
      movie.stub(:roll_die, 5) do
        movie.view
        assert_equal 11, movie.rank
      end
    end

    def test_does_not_change_rank_for_medium_number_roll
      movie = Movie.new("goonies", 10)
      movie.stub(:roll_die, 4) do
        movie.view
        assert_equal 10, movie.rank
      end
    end
  end
end