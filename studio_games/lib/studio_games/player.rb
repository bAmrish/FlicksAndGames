require_relative 'playable'
require_relative 'auditable'

class Player
  attr_reader :name, :found_treasures
  attr_accessor :health
  
  include Playable
  include Auditable

  def initialize(name, health = 100)
    @name = capitalize(name)
    @health = health
    @score = 0
    @found_treasures = Hash.new(0)
  end

  def score
    @health + points
  end

  def add_treasure(name, score)
    @found_treasures[name] += score
  end

  def points
    @found_treasures.values.sum
  end

  def capitalize(name)
    name
      .split(' ')
      .map{ |w| w.capitalize }
      .join(' ')
  end

  def to_s
    "[#{@name.rjust(15)}] health 💚: #{@health}, points 🎁: #{points}, score 🪙: #{score}"
  end

  def hello
    puts "I'm #{@name} with a health of #{@health} and a score of #{score}"
  end


  def roll_die
    rand(1..6)
  end
  
  def play
    roll = roll_die
    audit(roll, "🎲")
    case roll
    when 1..2
      drain
      puts "#{name} got drained 🩸"      
    when 3..4
      puts "#{name} got skipped 🫥"
    else
      boost
      puts "#{name} got boost 💪"
    end
  end

  def self.from_csv(line)
    name, health = line.split(",")
    health = health.nil? ? 50 : Integer(health)
    Player.new(name, health)
  rescue ArgumentError
    puts "Ignored invalid health '#{health}'"
    Player.new(name)
  end

  def to_csv
    "#{name}, #{score}"
  end

end

if __FILE__ == $0
  player = Player.new("adam", 30)
  (1..5).each { player.play }
end