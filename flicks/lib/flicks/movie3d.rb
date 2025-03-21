require_relative "movie"
module Flicks
  class Movie3d < Movie
    def initialize(name, rank = 5, wow = 10)
      super(name, rank)
      @wow = wow
    end

    def thumbs_up 
      1.upto(@wow){ super }
    end

  end
end

if __FILE__ == $0
  minions = Flicks::Movie3d.new("minions")
  puts minions.title
  puts minions.rank
  minions.thumbs_up
  puts minions

end