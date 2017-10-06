# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Adopt_with_Love/version"

Gem::Specification.new do |spec|
  spec.name          = "Adopt_with_Love"
  spec.version       = AdoptWithLove::VERSION
  spec.authors       = ["'Justin Daniel'"]
  spec.email         = ["'justinddaniel@gmail.com'"]

  spec.summary       = "This gem scrapes from the Human Society of Southwest Michigan and generates a CLI where users can
                        choose if they would like a dog or cat. The CLI then returns a list of dogs/cats scraped from the
                        website. Users can then choose one of those dogs/cats and the CLI returns a link to that animal's
                        profile page."
  spec.description   =  nil
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
