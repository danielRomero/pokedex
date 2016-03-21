module Pokedex
  class Generation
    
    attr_accessor :id, :region, :names, :species, :version_groups

    def initialize(args={})
      @id             = args['id']
      @names          = args['names'].map{ |name| {name: name['name'], locale: name['language']['name']} }
      @species        = args['pokemon_species'].map{ |pokemon_specie| pokemon_specie['url'] }
      @version_groups = args['version_groups'].map{ |version_group| version_group['url'] }
      @region         = Region.find_by_url args['main_region']['url']
    end

    def self.find id
      new Pokedex.get "api/v2/generation/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

    def name locale='es'
      n = @names.select{ |name| name[:locale] == locale.to_s }.first
      n ? n[:name] : @names.first[:name]
    end

  end
end