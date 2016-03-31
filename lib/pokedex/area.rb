module Pokedex
  class Area
    require 'pokedex/modules_helper/name'
    include Pokedex::ModulesHelper::Name

    attr_accessor :id, :names

    def initialize(args={})
      @id     = args['id']
      extract_names args
    end

    def self.find id
      new Pokedex.get "api/v2/location-area/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

  end
end
