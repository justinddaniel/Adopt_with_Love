require 'pry'
require 'nokogiri'
class PetsListing

  attr_accessor :dog, :cat
  attr_reader :petslist

  def initialize
    @petslist = []
    @petprofile = []
  end

  def dog
    html = open("http://humanesocietyswm.org/dogs-for-adoption/")
    doc = Nokogiri::HTML(html)
    names = doc.css(".gg-image-caption")
    c = 1
    names.each do |n|
      @petslist << "#{c}. #{n.text}"
      c += 1
    end
    puts @petslist
  end

  def cat
    puts "Meow! Meow! Meow!"
  end

end
