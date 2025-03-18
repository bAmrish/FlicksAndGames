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
kermit_playlist.play
kermit_playlist.print_stats

fossie_playlist = Playlist.new("Fossie")
fossie_playlist.add_movie(ghostbuster)
fossie_playlist.add_movie(gremlin)
fossie_playlist.play(5)
fossie_playlist.print_stats