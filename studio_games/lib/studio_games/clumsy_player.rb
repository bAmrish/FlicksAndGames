require_relative "player"

class ClumsyPlayer < Player
  def initialize(name, health=50, boost_factor=1)
    super(name, health)
    @clumsiness = 0.5
    @boost_factor = boost_factor
  end

  def boost
    @boost_factor.times { super } 
  end

  def add_treasure(name, score)
    super(name, score * @clumsiness)
  end
end

if __FILE__ == $0
  clumsy = ClumsyPlayer.new("klutz")

  clumsy.add_treasure("flute", 50)
  clumsy.add_treasure("flute", 50)
  clumsy.add_treasure("flute", 50)
  clumsy.add_treasure("star", 100)

  clumsy.found_treasures.each do |name, points|
    puts "#{name}: #{points} points"
  end
  puts "#{clumsy.points} total points"
end