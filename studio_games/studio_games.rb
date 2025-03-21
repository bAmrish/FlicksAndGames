require_relative 'lib/studio_games/player'
require_relative 'lib/studio_games/clumsy_player'
require_relative 'lib/studio_games/berserk_player'
require_relative 'lib/studio_games/game'

game = Game.new("The End game")

file_name = ARGV.shift || "players.csv"
from_file = File.join(__dir__, file_name)
game.load(from_file)

clumsy = ClumsyPlayer.new("klutz", 105, 10)
game.add_player(clumsy)
berserker = BerserkPlayer.new("berserker", 50)
game.add_player(berserker)

loop do
  print "\nHow many rounds do you want to play? ('q' for exit): "
  answer = gets.chomp.strip.downcase
  
  case answer
  when 'q', 'quit', 'quits', 'e', 'exit', 'exits'
    game.print_stats
    break
  when /^(\d)+$/
    game.play(answer.to_i)
  else
    print "Please enter a number or 'q' of quitting\n"
  end
end

game.save