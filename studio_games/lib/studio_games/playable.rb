module StudioGames
  module Playable
    def boost
      self.health += 15
    end

    def drain
      self.health -= 10 unless self.health <= 0
    end
  end
end
