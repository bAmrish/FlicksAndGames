class Player
  attr_reader :health, :name, :found_treasure

  def initialize(name, health = 100)
    @name = capitalize(name)
    @health = health
    @score = 0
    @found_treasure = Hash.new(0)
  end

  def score
    @health + points
  end

  def add_treasure(name, score)
    @found_treasure[name] += score
  end

  def points
    @found_treasure.values.sum
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

  def boost
    @health += 15
  end

  def drain
    @health -= 10 unless @health <= 0
  end

  def roll_die
    rand(1..6)
  end
  
  def play
    roll = roll_die
    print "🎲: #{roll} → "
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
    health = health.nil? ? 50 : health.to_i
    Player.new(name, health)
  end

  def to_csv
    "#{name}, #{score}"
  end

end

if __FILE__ == $0
  player = Player.new("adam", 30)
  (1..5).each { player.play }
end