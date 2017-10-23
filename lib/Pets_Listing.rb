require 'pry'
require 'nokogiri'
class PetsListing

  attr_accessor :name, :url, :type
  attr_reader :petslist, :petprofiles, :AwLController #I made these readers and not also writers to help discourage abuse of the instance
  #variables petslist and petprofiles, as well as the AwLController class. If a programmer pushes strings rather than class/instance objects
  # to these, for example, the code will break.
  @@all = []
  def initialize(name, url, type)
    @name = name
    @url = url
    @type = type
    @@all << self
  end

  def self.dog
    html = open("http://humanesocietyswm.org/dogs-for-adoption/")
    doc = Nokogiri::HTML(html) #This is the line that allows the nokogiri gem to start scraping from the website (html)
    #binding.pry
    doc.css('figure').each do |f|
      url = f.parent.attr("href")
      name = f.css(".gg-image-caption").text.strip
      self.new(name, url, 'dog')
    end
  end

  def self.dogs

    all.select{|p| p.type == 'dog'}
  end

  def self.all

    @@all
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
