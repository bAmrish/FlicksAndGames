require_relative 'lib/flicks/movie'
require_relative 'lib/flicks/playlist'

# Read the movie file name from command line arguments
# or default it to "movies.csv"
file_name = ARGV.shift || "movies.csv"
movie_file = "#{__dir__}/#{file_name}"

kermit_playlist = Playlist.new("Kermit")
kermit_playlist.load(movie_file)

loop do
  print "\nHow many viewings? ('quit' to exit): "
  answer = gets.chomp.strip.downcase

  case answer
  when /^(\d)+$/
    kermit_playlist.play(answer.to_i)
  when "q", "quit", "quits", "e", "exit", "exits"
    kermit_playlist.print_stats
    break
  else
    print "\nPlease type number or 'quit': "
  end
end

kermit_playlist.save

