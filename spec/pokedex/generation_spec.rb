require 'spec_helper'

describe Pokedex::Generation do
  before do
    VCR.insert_cassette 'generation', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:generation) { Pokedex::Generation.find(1) }

  it 'has a id number' do
    expect(
      generation.id
    ).to be > 0
  end

  it 'has at least one name' do
    expect(
      generation.name
    ).not_to be :empty?
  end

  it 'has at least one pokemon_url' do
    expect(
      generation.pokemon_urls
    ).not_to be :empty?
  end

  it 'has region' do
    expect(
      generation.region
    ).not_to be_nil

    expect(
      generation.region.class
    ).to be Pokedex::Region
  end
end
