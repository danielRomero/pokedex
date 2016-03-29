module Pokedex
  class Location

    attr_accessor :id, :names, :region, :areas

    def initialize(args = {})
      @id     = args['id']
      @names  = args['names'].map{ |name| {name: name['name'], locale: name['language']['name']} }
      @region = Region.find_by_url args['region']['url']
      @areas  = args['areas'].map{ |area| Area.find_by_url area['url'] }
    end

    def self.find id
      new Pokedex.get "api/v2/location/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

    def name locale='es'
      n = names.find{ |name| name[:locale] == locale.to_s }
      n ? n[:name] : ''
    end

  end
end
