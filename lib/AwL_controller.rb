#This is my CLI controller called by the bin/awlove file, with which the user interacts.
class AwLController

  attr_accessor :PetsListing

  def initialize
  end

  def summon
    puts "Hello! If you are interested in adopting a dog, type '1'."
    puts "If you are intested in adopting a cat, type '2'."
    petchoice
    puts "please type the number of the pet you wish to view, or type 'exit'"
  end

  def petchoice
    input = gets.strip
    input = input.to_i
    if input == 1
      PetsListing.new.dog
    elsif input == 2
      PetsListing.new.cat
    else
      puts "Invalid selection. Please type '1' or '2'."
      self.call
    end
  end

end
