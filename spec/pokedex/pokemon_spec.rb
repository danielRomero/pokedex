require 'spec_helper'

describe Pokedex::Pokemon do

  let(:pokemon) { get_random_pokemon}

  before do
    VCR.insert_cassette 'pokemon'
  end

  it 'has a id number' do
    expect(
      pokemon.id
    ).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  after do
      VCR.eject_cassette
    end

end
