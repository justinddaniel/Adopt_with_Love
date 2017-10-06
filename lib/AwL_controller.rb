#This is my CLI controller called by the bin/awlove file, with which the user interacts.
require 'pry'
class AwLController

  attr_accessor :PetsListing, :pet, :peturl

  def initialize
  end

  def summon
    puts "Hello! If you are interested in adopting a dog, type '1'."
    puts "If you are intested in adopting a cat, type '2'."
    petchoice
    puts "please type the number of the pet you wish to view, or type 'exit'"
    petselection
  end

  def petchoice
    input = gets.strip
    input = input.to_i
    if input == 1
      self.pet = PetsListing.new
      self.pet.dog
    elsif input == 2
      self.pet = PetsListing.new
      self.pet.cat
    else
      puts "Invalid selection. Please type '1' or '2'."
      self.summon
    end
  end

  def petselection
    input = gets.strip
    if input == 'exit'
      self.summon
    else
      index = (input.to_i - 1)
    end
    peturl = self.pet.petprofiles[index]
    puts peturl
  end
end
