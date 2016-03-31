module Pokedex
  class Pokemon
    require 'pokedex/modules_helper/name'
    include Pokedex::ModulesHelper::Name
    require 'pokedex/modules_helper/description'
    include Pokedex::ModulesHelper::Description

    attr_accessor :id, :sprite, :capture_rate, :names, :descriptions, :evolution_chain_url, :is_baby, :generas, :egg_groups, :generation_name

    def initialize(args={})
      @id                  = args['id']
      @generas             = args['genera'].map{ |genera| { genus: genera['genus'], locale: genera['language']['name']} }
      @descriptions        = get_descriptions args['flavor_text_entries']
      @is_baby             = args['is_baby']
      @sprite              = "#{Pokedex::API_BASE_URL}/media/img/#{args['id']}.png"
      @capture_rate        = args['capture_rate']
      @evolution_chain_url = args['evolution_chain']['url']
      @egg_groups          = args['egg_groups'].map{ |egg_groups| EggGroup.find_by_url egg_groups['url'] }
      @generation_name     = args['generation']['name']
      extract_names args
    end

    def self.find id
      new Pokedex.get "api/v2/pokemon-species/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

    def genera locale='es'
      extract_locale generas, locale, :genus
    end

    def evolution_chain
      EvolutionChain.find_by_url evolution_chain_url
    end

    private

    # return the first description by locale from API response
    def get_descriptions text_entries
      checked_locales = []
      text_entries.map{ |text_entry|
        if checked_locales.include?(text_entry['language']['name'])
          nil
        else
          checked_locales << text_entry['language']['name']
          { locale: text_entry['language']['name'], description: text_entry['flavor_text'] }
        end
      }.compact
    end

  end
end
