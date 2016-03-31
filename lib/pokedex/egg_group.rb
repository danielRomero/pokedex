module Pokedex
  class EggGroup
    require 'pokedex/modules_helper/name'
    include Pokedex::ModulesHelper::Name

    attr_accessor :id, :names, :pokemon_urls

    def initialize(args = {})
      @id           = args['id']
      @pokemon_urls = args['pokemon_species'].map{ |pokemon_specie| pokemon_specie['url'] }
      extract_names args
    end

    def self.find id
      new Pokedex.get "api/v2/egg-group/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end
  end
end
