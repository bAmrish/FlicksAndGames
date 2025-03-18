require_relative 'lib/studio_games/player'
require_relative 'lib/studio_games/game'

iron_man = Player.new("iron man", 50)
hulk = Player.new("hulk", 50)
wonder_women = Player.new("wonder women", 50)
batman = Player.new("batman", 50)

game = Game.new("Marvel and DC")
game.add_player(iron_man)
game.add_player(hulk)
game.add_player(wonder_women)
game.add_player(batman)

game.play
game.print_stats

game = Game.new("End Game")
game.add_player(iron_man)
game.add_player(hulk)
game.play(6)
game.print_stats