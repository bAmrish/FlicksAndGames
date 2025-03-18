require_relative 'lib/flicks/movie'
require_relative 'lib/flicks/playlist'

goonies = Movie.new("goonies", 10)
ghostbuster = Movie.new("ghostbuster", 9)
goblin = Movie.new("goblin")
gremlin = Movie.new("gremlin", 7)

kermit_playlist = Playlist.new("Kermit")
kermit_playlist.add_movie(goonies)
kermit_playlist.add_movie(ghostbuster)
kermit_playlist.add_movie(goblin)

loop do
  print "\nHow many viewings? ('quit' to exit): "
  answer = gets.chomp.strip.downcase

  case answer
  when /^(\d)+$/
    kermit_playlist.play(answer.to_i)
  when "quit", "quits", "e", "exit", "exits"
    kermit_playlist.print_stats
    break
  else
    print "\nPlease type number or 'quit': "
  end
end

