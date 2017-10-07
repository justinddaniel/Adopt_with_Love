#This is my CLI controller called by the bin/awlove file, with which the user interacts.
class AwLController

  attr_accessor :PetsListing, :pet, :peturl #ensures that there are reader and writer methods for each of these.
  #This class must interact with the main scraper, PetsListing.

  def initialize
  end

  def summon
    puts "Hello! If you are interested in adopting a dog, type '1'." #Greeting message with instructions to user.
    puts "If you are intested in adopting a cat, type '2'."
    petchoice #new instance method that will take user input and call the scraper for the appropriate website.
    puts "please type the number of the pet you wish to view, or type 'exit'"
    petselection
  end

  def petchoice
    input = gets.strip
    input = input.to_i
    if input == 1
      self.pet = PetsListing.new #This line instantiates a new PetsListing object and ensures communication
      #between the two objects by making the pet instance variable of self a new instance of the PetsListing Class.
      self.pet.dog #calls the instance method of dog, which is part of the PetsListing Class. This will actually do the scraping from the dog
      #section of the website.
    elsif input == 2  #The next 3 lines of code are mirror images of above in the case users want to look at cats.
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
    elsif  input.to_i > 0
      index = (input.to_i - 1)
    else
      puts "Invalid selection. Please type the number of the pet you wish to view or type 'exit'."
      petselection
    end
    peturl = self.pet.petprofiles[index]
    puts peturl
  end
end
