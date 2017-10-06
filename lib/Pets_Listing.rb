require 'pry'
require 'nokogiri'
class PetsListing

  attr_accessor :dog, :cat
  attr_reader :petslist

  def initialize
    @petslist = []
  end

  def dog
    html = open("http://humanesocietyswm.org/dogs-for-adoption/")
    doc = Nokogiri::HTML(html)
  end

  def cat
    puts "Meow! Meow! Meow!"
  end

end
