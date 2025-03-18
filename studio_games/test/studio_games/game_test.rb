require "minitest/autorun"
require_relative "../../lib/studio_games/player"
require_relative "../../lib/studio_games/game"

class GameTest < Minitest::Test 

  def test_game_title_capitalized
    game = Game.new("endgame")
    assert_equal "Endgame", game.title
  end

  def test_player_list_empty_when_initalized
    game = Game.new("endgame")
    assert_empty game.players
  end

  def test_players_list_updated_when_added
    game = Game.new("endgame")
    p1 = Player.new("Player 1")
    p2 = Player.new("Player 2")
    game.add_player(p1)
    game.add_player(p2)
    assert_equal 2, game.players.size
  end
end