module Pokedex
  require 'unirest' # for api requests

  require 'pokedex/area'
  require 'pokedex/egg_group'
  require 'pokedex/evolution_chain'
  require 'pokedex/generation'
  require 'pokedex/location'
  require 'pokedex/pokemon'
  require 'pokedex/region'
  require 'pokedex/version_group'

  class << self

    def get resource_path, options = {}
      Unirest.timeout(timeout)
      url = "#{Pokedex::API_BASE_URL}/#{resource_path}"
      puts "[Pokedex] request to #{url} -- timeout: #{timeout}"
      response = Unirest.get(url, headers: {}, parameters: options[:params], auth: nil)
      response.body
    end

    def timeout=(timeout_value)
      @@timeout = timeout_value
    end

    def timeout
      @@timeout ||= Pokedex::DEFAULT_TIMEOUT
    end
  end
end
