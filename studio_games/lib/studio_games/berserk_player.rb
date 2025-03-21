require_relative "player"

class BerserkPlayer < Player

  def initialize(name, health)
    super(name, health)
    @boost_count = 0
    @berserk_mode = false
  end

  def berserk?
    @boost_count > 5
  end

  def boost
    super
    @boost_count += 1
    puts "#{@name} is berserk!" if berserk?
  end

  def drain
    berserk? ? boost : super    
  end

end

if __FILE__ == $0
  if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times { berserker.boost }
    2.times { berserker.drain }
    puts berserker.health
  end
end