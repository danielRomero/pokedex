require 'spec_helper'

describe Pokedex::Pokemon do
  # let(:pokemon) { get_random_pokemon }
  before do
    VCR.insert_cassette 'pokemon'
  end

  after do
    VCR.eject_cassette
  end

  let(:pokemon) { Pokedex::Pokemon.find 1 }

  it 'has a id number' do
    expect(
      pokemon.id
    ).not_to be nil
  end

  it 'has at least one name' do
    expect(
      pokemon.names.length
    ).not_to be :empty?

    expect(
      pokemon.name
    ).not_to be nil
  end

  it 'has at least one description' do
    expect(
      pokemon.descriptions.length
    ).not_to be :empty?

    expect(
      pokemon.description
    ).not_to be nil
  end

  it 'has a id number' do
    expect(
      pokemon.id
    ).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end
end
