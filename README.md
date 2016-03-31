# Pokedex
[![Build Status](https://travis-ci.org/danielRomero/pokedex.svg?branch=master)](https://travis-ci.org/danielRomero/pokedex)
[![Code Climate](https://codeclimate.com/github/danielRomero/pokedex/badges/gpa.svg)](https://codeclimate.com/github/danielRomero/pokedex)
[![Test Coverage](https://codeclimate.com/github/danielRomero/pokedex/badges/coverage.svg)](https://codeclimate.com/github/danielRomero/pokedex/coverage)

Ruby wrapper for http://pokeapi.co Pokemon API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pokedex'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pokedex

## Usage

#### Available configuration
You can set different timeout. The http://pokeapi.co sometimes can be very slow.
  ```ruby
  # application.rb
  Pokedex.timeout = 30 # seconds
  ```
#### Methods
Example of Pokemon info
```
pokemon = Pokedex::Pokemon.find 1
pokemon.name 'zh' # Pokemon's name by locale
pokemon.evolution_chain

```
##### Resources Availables:
  - Area: Location areas are sections of areas, such as floors in a building or cave. Each area has its own set of possible Pokémon encounters.

  - EggGroup: Egg Groups are categories which determine which Pokémon are able to interbreed. Pokémon may belong to either one or two Egg Groups.

  - EvolutionChain: Evolution chains are essentially family trees. They start with the lowest stage within a family and detail evolution conditions for each as well as Pokémon they can evolve into up through the hierarchy.

  - Generation: A generation is a grouping of the Pokémon games that separates them based on the Pokémon they include.

  - Location: Locations that can be visited within the games. Locations make up sizable portions of regions, like cities or routes.

  - Pokemon: Pokémon are the creatures that inhabit the world of the Pokémon games. They can be caught using Pokéballs and trained by battling with other Pokémon.

  - Region: A region is an organized area of the Pokémon world. Most often, the main difference between regions is the species of Pokémon that can be encountered within them.

  - VersionGroup: Version groups categorize highly similar versions of the games.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danielromero/pokedex.

### Steps to contribute:
  1. Open new issue https://github.com/danielRomero/pokedex/issues/new
  2. Clone this repo to your local machine `git clone git@github.com:danielRomero/pokedex.git`
  3. Checkout to new branch with issue ID as name `git checkout -b issue-1234`
  4. Install dependencies `bundle install`
  5. Test your changes `bundle exec rake spec`
  6. Commit and push your branch and make new pull request https://github.com/danielRomero/pokedex/compare
  7. If everything is ok, your changes will be included to the next version.

## TODO

1. Improve Tests
2. Cover all http://pokeapi.co resources & attributes

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
