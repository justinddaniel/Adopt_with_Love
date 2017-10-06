class PetsListing

  attr_reader :petslist

  def initialize
    @petslist = []
  end

  def dog
    puts "Woof!"
  end

  def cat
    puts "Meow! Meow!"
  end

end
