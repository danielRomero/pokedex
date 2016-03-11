module Pokedex
  require 'unirest'
  require 'pokedex/pokemon'
  require 'pokedex/type'
  
  DEFAULT_TIMEOUT = 30 # seconds

  class << self
    def get resource_path, options = {}
      Unirest.timeout(timeout)
      url = "#{Pokedex::API_BASE_URL}/#{resource_path}"

      puts "\n[Pokedex] request to #{url}\n"
      
      response = Unirest.get(url, headers: {}, parameters: options[:params], auth: nil)
      puts response.code
      response.body
    end

    def timeout
      @@timeout || DEFAULT_TIMEOUT
    end

    def timeout=(tiemout_value)
      @@timeout = tiemout_value
    end

  end
end
