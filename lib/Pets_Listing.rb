require 'pry'
require 'nokogiri'
class PetsListing

  attr_accessor :dog, :cat
  attr_reader :petslist, :petprofiles, :AwLController

  def initialize
    @petslist = []
    @petprofiles = []
  end

  def dog
    html = open("http://humanesocietyswm.org/dogs-for-adoption/")
    doc = Nokogiri::HTML(html)
    sites = doc.css("#grid-gallery-3 a")
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

  def cat
    html = open("http://humanesocietyswm.org/dogs-for-adoption/")
    doc = Nokogiri::HTML(html)
    sites = doc.css("#grid-gallery-3 a")
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
