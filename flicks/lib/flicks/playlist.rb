require_relative 'snackbar'

class Playlist
  attr_reader :name, :movies
  
  def initialize(name)
    @name = name.capitalize
    @movies = []
  end

  def load_movies(from_file)
    File.readlines(from_file).each do |line|
      name, rank = line.chomp.split(',')
      rank = rank.nil? ? 5 : rank.to_i
      movie = Movie.new(name, rank)
      add_movie(movie)
    end
  end

  def add_movie(movie)
    @movies << movie
  end

  def play(viewings = 3)

    puts "-" * 30
    puts "Playing #{@name}'s playlist"
    puts "\nBefore watching: "
    puts @movies
    puts 

    puts Snackbar.print_snacks_menu

    1.upto(viewings) do |viewing|
      puts "Viewing #{viewing}: "
      
      movies.each do |movie|
        snack = Snackbar.random_snack
        movie.add_snack(snack.name, snack.price)
        puts "#{@name} purchased #{snack.name} for $#{snack.price}"  
        movie.view
      end
      puts
    end

    puts "\nAfter watching: "
    puts movies
  end

  def sorted_movies
    @movies.sort{ |m| m.rank}.reverse
  end

  def print_stats
    puts "\n#{@name}'s Stats: "
    puts sorted_movies
    puts "Snacks Eaten: "
    @movies.each do |movie|
      puts "Snacks Eaten for #{movie.title}"
      movie.snacks_eaten.each do |name, price|
        puts "#{name}: $#{price}"
      end
      puts "Total Snack Price $#{movie.total_snack_price}"
    end
  end
end
