require_relative 'treasure_trove'
require_relative 'player.rb'

class Game
  attr_reader :title, :players
  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def load(from_file)
    File.readlines(from_file, chomp: true).each do |line|
      next if line.empty?
      name, health = line.split(",")
      health = health.nil? ? 50 : health.to_i
      player = Player.new(name, health)
      add_player(player)
    end
  end

  def add_player(player)
    @players << player
  end

  def prt(str, char = " ", col_size = 50)
    puts str.center(col_size, char)
  end
  
  def print_line
    prt "-" * 30, "-"
  end
  
  def print_dotted_line
    prt "." * 30, "."
  end

  def print_header
    puts "\n"
    print_line     
    prt "Playing Game: #{@title}"    
    print_line
    print_treasure_items
    print_line

    puts "Before Playing: "
    puts self
    print_line
  end

  def print_footer
    print_line
    puts "After Playing: "
    puts self
    print_line
  end

  def print_treasure_items
    puts "Available Treasures in the game: "
    puts TreasureTrove::treasure_items
  end

  def play(rounds = 3)
    print_header

    1.upto(rounds) do |round|
      puts("Round #{round}: ")
      print_dotted_line
      @players.each do |player|        
        player.play
        treasure = TreasureTrove.random_treasure
        player.add_treasure(treasure.name, treasure.points)
        puts "#{player.name} found #{treasure.name} #{treasure.emoji} worth #{treasure.points}"
        puts
      end
      puts
    end
    print_footer
  end

  def print_stats
    print_line
    prt "Stats for : #{@title}" 
    
    # Show players
    @players.each {|p| puts p}

    # Show each players stat
    @players.each do |player|
      print_dotted_line
      prt "Stats for #{player.name}"  
      player.found_treasure.each do |name, score|
        puts "#{name.ljust(20, ".")} $#{score}"  
      end
      puts "Total: $#{player.points}"
    end

    print_dotted_line
    
    # Print high scores
    prt "High Scores"
    sorted_player.each do |p|
      puts "#{p.name.ljust(20, ".")} #{p.score}"
    end

    print_line
    
  end

  def sorted_player
    @players.sort_by { |p| p.score }.reverse
  end

  def to_s
    @players.collect { |p| p.to_s }.join("\n")
  end
end
