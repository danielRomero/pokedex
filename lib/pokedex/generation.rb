module Pokedex
  class Generation

    require 'pokedex/modules_helper/name'
    include Pokedex::ModulesHelper::Name

    attr_accessor :id, :region_url, :names, :pokemon_urls, :version_groups

    def initialize(args={})
      @id             = args['id']
      @pokemon_urls   = args['pokemon_species'].map{ |pokemon_specie| pokemon_specie['url'] }
      @version_groups = args['version_groups'].map{ |version_group| version_group['url'] }
      @region_url     = args['main_region']['url']
      extract_names args
    end

    def self.find id
      new Pokedex.get "api/v2/generation/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

    def region
      Region.find_by_url region_url
    end

  end
end
