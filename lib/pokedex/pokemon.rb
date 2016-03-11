module Pokedex
  class Pokemon
    attr_accessor :id, :name, :types, :sprite

    def initialize(args={})
      args = args.with_indifferent_access
      @id = args[:id]
      @name = args[:name]
      @sprite = "#{Pokedex::API_BASE_URL}/media/img/#{args[:id]}.png"
      @types = args[:types].map{ |type| Pokedex::Type.find_by_url type[:type][:url] }
    end

    def self.find id
      self.new Pokedex.get "api/v2/pokemon/#{id}"
    end

    def self.get_raw id
      Pokedex.get "api/v2/pokemon/#{id}"
    end

  end
end