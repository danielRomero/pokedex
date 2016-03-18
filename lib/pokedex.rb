module Pokedex
  require 'unirest'
  require 'pry'
  require 'awesome_print'
  require 'pokedex/pokemon'
  require 'pokedex/evolution_chain'
  require 'pokedex/egg_group'

  class << self

    def get resource_path, options = {}
      Unirest.timeout(timeout)
      url = "#{Pokedex::API_BASE_URL}/#{resource_path}"

      puts "\n[Pokedex] request to #{url}\n -- config:\n timeout #{timeout}\n cache: #{cache_method.class.to_s}"
      if cache_method
        response = cache_method.fetch resource_path do
          puts "Cache Miss"
          Unirest.get(url, headers: {}, parameters: options[:params], auth: nil)
        end
      else
        puts "perform without cache"
        response = Unirest.get(url, headers: {}, parameters: options[:params], auth: nil)
      end
      puts response.code
      response.body
    end

    def timeout=(timeout_value)
      @@timeout = timeout_value
    end

    def timeout
      @@timeout ||= Pokedex::DEFAULT_TIMEOUT
    end

    def cache_method=(cache_method_value)
      @@cache_method = cache_method_value
    end

    def cache_method
      @@cache_method ||= nil
    end

  end
end
