module Pokedex
  class EvolutionChain
    attr_accessor :id, :evolves

    def initialize(args = {})
      @id      = args['id']
      @evolves = [ generate_evolves(args['chain']) ]
    end

    def self.find id
      new Pokedex.get "api/v2/evolution-chain/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

    private

    def generate_evolves(chain_args={}, evolves={})
      return evolves if chain_args.empty?
      evolves[:pokemon]    = chain_args['species'].nil? ?
                              nil :
                              Pokemon.find_by_url(chain_args['species']['url'])
      evolves[:min_level]  = chain_args['evolution_details'].nil? ?
                              nil :
                              chain_args['evolution_details']['min_level']
      evolves[:evolves_to] = chain_args['evolves_to'].map{ |evolve|
                              generate_evolves(evolve)}
      evolves
    end

  end
end
