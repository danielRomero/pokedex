module Pokedex
  module ModulesHelper
    module Description
      require 'pokedex/modules_helper/locale'
      include Pokedex::ModulesHelper::Locale

      def description(locale='es')
        extract_locale descriptions, locale, :description
      end
    end
  end
end
