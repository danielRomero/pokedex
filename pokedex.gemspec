# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pokedex/version'

Gem::Specification.new do |spec|
  spec.name          = "pokedex"
  spec.version       = Pokedex::VERSION
  spec.authors       = ["Daniel Romero Esteban"]
  spec.email         = ["daniel.romero.esteban@gmail.com"]

  spec.summary       = %q{Ruby wrapper for http://pokeapi.co Pokemon API.}
  spec.homepage      = "https://github.com/danielRomero/pokedex"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'unirest'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.51"
end
