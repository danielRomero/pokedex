module Pokedex
  module ModulesHelper
    module Name
      require 'pokedex/modules_helper/locale'
      include Pokedex::ModulesHelper::Locale

      def name(locale='es')
        extract_locale names, locale, :name
      end

      private

      def extract_names(args={})
        @names = args['names'].map{ |name| {name: name['name'], locale: name['language']['name']} }
      end
    end
  end
end
