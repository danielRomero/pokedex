module Pokedex
  class Type
    attr_accessor :id

    def initialize(args={})
      args = args.with_indifferent_access
      @id = args[:id]
      @names = args[:names].map{ |name| {name: name[:name], locale: name[:language][:name]} }
    end

    def name locale='es'
      locale = locale.to_s
      n = @names.select{ |name| name[:locale] == locale }.first
      n ? n[:name] : ''
    end

    def self.find id
      self.new Pokedex.get "api/v2/type/#{id}"
    end

    def self.find_by_url url
      self.new Pokedex.get URI.parse(url).path
    end
  end
end