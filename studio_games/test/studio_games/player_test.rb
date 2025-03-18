require "minitest/autorun"
require_relative "../../lib/studio_games/player"

class PlayerTest < Minitest::Test

  def setup

    # This suppresses the output form test classes
    $stdout = StringIO.new
  end

  def test_has_capitalized_initial_name
    player = Player.new("batman", 20)
    assert_equal "Batman", player.name
  end

  def test_has_initial_health
    player = Player.new("batman", 20)
    assert_equal 20, player.health
  end

  def test_has_initial_health_set_if_non_passed
    player = Player.new("batman")
    assert_equal 100, player.health
  end

  def test_boost_increases_player_health_by_15
    player = Player.new("batman", 20)
    player.boost
    assert_equal 35, player.health
  end

  def test_drain_decreases_player_health_by_10
    player = Player.new("batman", 20)
    player.drain
    assert_equal 10, player.health
  end
  
  def test_player_boosted_if_high_dice_roll
    player = Player.new("batman", 20)

    player.stub(:roll_die, 6) do 
      player.play
      assert_equal 35, player.health
    end
  end

  def test_player_drained_if_low_dice_roll
    player = Player.new("batman", 20)

    player.stub(:roll_die, 2) do 
      player.play
      assert_equal 10, player.health
    end
  end

  def test_player_unaffected_if_medium_dice_roll
    player = Player.new("batman", 20)

    player.stub(:roll_die, 4) do 
      player.play
      assert_equal 20, player.health
    end
  end
end