require 'spec_helper'

describe Pokedex::EggGroup do
  before do
    VCR.insert_cassette 'egg_group', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:egg_group) { Pokedex::EggGroup.find(1) }

  it 'has a id number' do
    expect(
      egg_group.id
    ).to be > 0
  end

  it 'has at least one name' do
    expect(
      egg_group.name
    ).not_to be :empty?
  end

  it 'has at least one pokemon_url' do
    expect(
      egg_group.pokemon_urls
    ).not_to be :empty?
  end
end
