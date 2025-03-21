module Rankable
  def thumbs_up
    self.rank += 1
  end

  def thumbs_down
    self.rank -= 1    
  end
end