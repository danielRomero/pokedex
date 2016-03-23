$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'vcr'
require 'webmock/minitest'

require 'pokedex'
require 'pokedex/pokemon'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
end

def get_random_pokemon
  id = rand(Pokedex::TOTAL_POKEMON_COUNT) + 1
  Pokedex::Pokemon.find(id)
end
