require 'pry'
require 'nokogiri'
class PetsListing

  attr_accessor :dog, :cat
  attr_reader :petslist, :petprofiles, :AwLController #I made these readers and not also writers to help discourage abuse of the instance
  #variables petslist and petprofiles, as well as the AwLController class. If a programmer pushes strings rather than class/instance objects
  # to these, for example, the code will break.

  def initialize
    @petslist = [] #Once a new class object is instantiated from the AwL_controller then it needs two empty array for objects to be pushed into later.
    @petprofiles = []
  end

  def dog
    html = open("http://humanesocietyswm.org/dogs-for-adoption/")
    doc = Nokogiri::HTML(html) #This is the line that allows the nokogiri gem to start scraping from the website (html)
    sites = doc.css("#grid-gallery-3 a") #This selects the individual dog objects which include names and profile links.
    sites.each do |s|
      @petprofiles << s['href'] #This accesses the weblinks of each animal and saves them for later as separate indexes in the petprofiles array.
    end

    names = doc.css(".gg-image-caption")
    c = 1
    names.each do |n|
      @petslist << "#{c}. #{n.text}" #This saves the name of each animal to the petslist.
      c += 1
    end
    puts @petslist #This returns the petlist by printing out one line for each name; this makes it easier for the user to reader
    #rather than having to scroll through an array. The user then can select the number of he name of the animal they wish to view (coded elsewhere).
  end

  def cat
    html = open("http://humanesocietyswm.org/cats-for-adoption/") #The notes above all apply for the cat method as well; they are virtually identical
    # to the dog method except a different webpage and slightly different css selectors were needed.
    doc = Nokogiri::HTML(html)
    sites = doc.css("#grid-gallery-1 a")
    sites.each do |s|
      @petprofiles << s['href']
    end

    names = doc.css(".gg-image-caption")
    c = 1
    names.each do |n|
      @petslist << "#{c}. #{n.text}"
      c += 1
    end
    puts @petslist
  end

end
