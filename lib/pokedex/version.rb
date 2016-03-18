module Pokedex
  VERSION = "0.0.0.35"
  API_VERSION = 'v2'
  API_BASE_URL = 'http://pokeapi.co'
  API_PATH = "/api/#{API_VERSION}/"
  DEFAULT_TIMEOUT = 30 # seconds
  ENABLE_RAILS_CACHE = false # set true if you use this gem with rails to cache requests
end