module Pokedex
  class Area
    require 'pokedex/translation/name'
    include Pokedex::Translation::Name
    
    attr_accessor :id, :names

    def initialize(args={})
      @id     = args['id']
      @names  = args['names'].map{ |name| {name: name['name'], locale: name['language']['name']} }
    end

    def self.find id
      new Pokedex.get "api/v2/location-area/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

  end
end
