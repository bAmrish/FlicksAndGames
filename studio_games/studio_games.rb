require_relative 'lib/studio_games/player'
require_relative 'lib/studio_games/game'

game = Game.new("The End game")
players = ["iron man", "hulk", "wonder women", "batman"]

players.each do |name|
  player = Player.new(name)  
  game.add_player(player)
end

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
