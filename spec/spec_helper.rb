require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'vcr'

require 'pokedex'
require 'pokedex/area'
require 'pokedex/egg_group'
require 'pokedex/evolution_chain'
require 'pokedex/generation'
require 'pokedex/location'
require 'pokedex/pokemon'
require 'pokedex/region'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
  config.ignore_hosts 'codeclimate.com'
end

def random_pokemon
  id = [1, 2, 3, 60, 51, 60, 80, 151, 238, 300, 501, 601, 700, 721].sample
  # id = rand(Pokedex::TOTAL_POKEMON_COUNT) + 1
  Pokedex::Pokemon.find(id)
end
