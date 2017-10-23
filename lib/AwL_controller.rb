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
    petselection #This instance method takes the user's next input to return a weblink to the pet's profile.
  end

  def petchoice
    input = gets.strip
    input = input.to_i
    if input == 1
      PetsListing.dog #calls the instance method of dog, which is part of the PetsListing Class. This will actually do the scraping from the dog
      #section of the website.
      list_dogs
    elsif input == 2  #The next 3 lines of code are mirror images of above in the case users want to look at cats.
      self.pet = PetsListing.new
      self.pet.cat
    else
      puts "Invalid selection. Please type '1' or '2'." #This line is necessary in case a user types something other than an integer of 1 or 2.
      #It is designed to display the error message. The line below then loops the user back to the beginning.
      self.summon
    end
  end

  def list_dogs
    PetsListing.all.each.with_index(1) do |p, index|
      puts "#{index}. #{p.name}"
    end
  end

  def petselection
    input = gets.strip
    if input == 'exit' #Users probably will want a way to get out of this sectin and return to where they can choose a different pet to look at.
      self.summon
    elsif  input.to_i.between?(1, PetsListing.all.size) #I found it necessary to specify that input.to_i method makes an integer of greater than 1 because I found that if text
      #such as "pet" is entered by the user it will convert it to an integer of 0! I thus needed to give the program a way of taking such input and
      #returning an error message and looping them back to the start of the selection.
      index = (input.to_i - 1) #The code pulls the weblink from an array and thus the input number needs to be subtracted by one for the index of the array.
    else
      puts "Invalid selection. Please type the number of the pet you wish to view or type 'exit'."
      petselection
    end
    pet = PetsListing.all[index]
    puts pet.url #This is the end of the interaction where the user can simply click on the weblink the interface puts out to go directly to the
    #pets profile page in the browser.
  end
end
