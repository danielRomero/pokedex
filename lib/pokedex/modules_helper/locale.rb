module Pokedex
  module ModulesHelper
    module Locale
      # extract elem from array of hashes depends of locale
      # array => [{elem: 'translation', locale: 'en'}, {elem: 'traduccion', locale: 'es'}]
      # locale => 'es', 'en', 'it'...
      # elem => :name, :description, :genus...
      def extract_locale(array, locale, elem)
        n = array.find{ |elem| elem[:locale] == locale.to_s }
        n ? n[elem] : ''
      end
    end
  end
end
