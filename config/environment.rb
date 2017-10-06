#These are all of my required files. I tried to follow best practices to
#put all of my required files in one file and then have my main files reference
# this one, environment.rb. Due to the legacy structure of this originating as
# a ruby Gem bundler pages such as Gemfile, Gemgile.lock, Adopt_with_Love.gemspec,
# and Rakefile are also required.
require "bundler/setup"
require "Adopt_with_Love"
require "open-uri"
require "nokogiri"
require_relative "../lib/AwL_controller.rb"
require_relative "../lib/Pets_Listing.rb"
