module Pokedex
  class Region
    require 'pokedex/modules_helper/name'
    include Pokedex::ModulesHelper::Name

    attr_accessor :id, :names, :generation, :version_groups_urls

    def initialize(args={})
      @id                  = args['id']
      @generation          = Generation.find_by_url args['main_generation']['url']
      @version_groups_urls = args['version_groups'].map{ |version_group| version_group['url'] }
      extract_names args
    end

    def self.find id
      new Pokedex.get "api/v2/region/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

    def version_groups
      version_groups_urls.map{ |version_group_url| VersionGroup.find_by_url version_group_url }
    end

  end
end
