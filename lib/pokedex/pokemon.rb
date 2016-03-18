module Pokedex
  class Pokemon
    attr_accessor :id, :sprite, :capture_rate, :names, :descriptions, :evolution_chain_url, :is_baby, :generas, :egg_groups_url

    def initialize(args={})
      @id                  = args['id']
      @names               = args['names'].map{ |name| { name: name['name'], locale: name['language']['name']} }
      @generas             = args['genera'].map{ |name| { genus: name['genus'], locale: name['language']['name']} }
      @descriptions        = get_descriptions args['flavor_text_entries']
      @is_baby             = args['is_baby']
      @sprite              = "#{Pokedex::API_BASE_URL}/media/img/#{args['id']}.png"
      @capture_rate        = args['capture_rate']
      @evolution_chain_url = args['evolution_chain']['url'] if args['evolution_chain']
      @egg_groups_url      = args['egg-groups'].map{ |egg_groups| egg_groups['url'] }
      @generation_name     = args['generation']['name']
      @version_groups      = args['version_groups'].map{ |version_group| version_group['name'] }
    end

    def self.find id
      new Pokedex.get "api/v2/pokemon-species/#{id}"
    end

    def self.find_by_url url
      new Pokedex.get URI.parse(url).path
    end

    def self.get_raw id
      Pokedex.get "api/v2/pokemon-species/#{id}"
    end

    def name locale='es'
      n = @names.select{ |name| name[:locale] == locale.to_s }.first
      n ? n[:name] : ''
    end

    def genera locale='es'
      n = @generas.select{ |genera| name[:locale] == locale.to_s }.first
      n ? n[:genera] : ''
    end

    def description locale='es'
      n = @descriptions.select{ |description| description[:locale] == locale.to_s }.first
      n ? n[:description] : ''
    end

    def evolution_chain
      EvolutionChain.find_by_url evolution_chain_url
    end

    def egg_groups
      egg_groups_url.map{ |egg_group_url| EggGroup.find_by_url egg_group_url }
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