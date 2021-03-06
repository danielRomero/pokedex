module Pokedex
  class VersionGroup
    attr_accessor :id, :name, :generation

    def initialize(args={})
      @id = args['id']
      @name = args['name']
      @generation = Generation.find_by_url args['generation']['url']
    end

    def self.find id
      self.new Pokedex.get "api/v2/version-group/#{id}"
    end

    def self.find_by_url url
      self.new Pokedex.get URI.parse(url).path
    end
  end
end
