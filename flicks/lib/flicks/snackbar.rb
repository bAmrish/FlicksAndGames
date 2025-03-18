module Snackbar
  Snack = Data.define(:name, :price)

  SNACKS = [
    Snack.new("popcorn", 3),
    Snack.new("candy", 1),
    Snack.new("nachos", 4),
    Snack.new("pretzels", 5),
  ]

  def self.print_snacks_menu
    puts "The Snack Bar Menu: "
    SNACKS.each do |snack|
      puts "#{snack.name} for #{snack.price}"
    end
    puts 
  end

  def self.random_snack
    SNACKS.sample
  end

end