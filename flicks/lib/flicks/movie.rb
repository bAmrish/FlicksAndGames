require_relative 'rankable'

class Movie
  include Rankable
  attr_reader :title, :rank, :snacks_eaten
  attr_writer :title, :rank
  
  def initialize(title, rank=5)
    @title = title.capitalize
    @rank = rank
    @snacks_eaten = Hash.new(0)
  end  

  def title=(title)
    @title = title.capitalize
  end

  def add_snack(name, price)
    @snacks_eaten[name] += price
  end

  def total_snack_price
    @snacks_eaten.values.sum
  end
  
  def roll_die
    rand(1..6)
  end

  def view
    die_roll = roll_die

    case die_roll
    when 1..2
      thumbs_down
      puts "#{title} gets a thumbs down 👎"
    when 3..4
      puts "#{title} was skipped 🫥"
    else
      thumbs_up
      puts "#{title} gets a thumbs up 👍"
    end
  end

  def self.from_csv(line)
    title, rank = line.chomp.split(',')
    rank = rank.nil? ? 5 : Integer(rank)
    Movie.new(title, rank)
  rescue ArgumentError
    puts "Ignored invalid rank '#{rank}'"
    Movie.new(title)
  end

  def to_csv
    "#{title}, #{rank}"
  end

  def to_s
    "#{@title} has a rank of #{@rank}"
  end
end

if __FILE__ == $0
  movie = Movie.new("star wars", 10)
  puts movie
end