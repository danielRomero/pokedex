module Pokedex
module Translation
module Name
  def name locale='es'
    n = names.find{ |name| name[:locale] == locale.to_s }
    n ? n[:name] : ''
  end
end
end
end
