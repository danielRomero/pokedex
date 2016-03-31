module Pokedex
  class Location
    require 'pokedex/modules_helper/name'
    include Pokedex::ModulesHelper::Name

    attr_accessor :id, :names, :region, :areas

    def initialize(args = {})
      @id     = args['id']
      @region = Region.find_by_url args['region']['url']
      @areas  = args['areas'].map{ |area| Area.find_by_url area['url'] }
      extract_names args
    end

    def self.find id
      new Pokedex.get "api/v2/location/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

  end
end
