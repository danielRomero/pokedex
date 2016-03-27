module Pokedex
  class EggGroup

    attr_accessor :id, :names, :pokemon_urls

    def initialize(args = {})
      @id           = args['id']
      @names        = args['names'].map{ |name| {name: name['name'], locale: name['language']['name']} }
      @pokemon_urls = args['pokemon_species'].map{ |pokemon_specie| pokemon_specie['url'] }
    end

    def self.find id
      new Pokedex.get "api/v2/egg-group/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

    def name locale='es'
      n = names.select{ |name| name[:locale] == locale.to_s }.first
      n ? n[:name] : ''
    end
  end
end
