require 'spec_helper'

describe Pokedex::Pokemon do
  before do
    VCR.insert_cassette 'pokemon', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:pokemon) { random_pokemon }

  it 'has a id number' do
    expect(
      pokemon.id
    ).to be > 0
  end

  it 'has at least one name' do
    expect(
      pokemon.name
    ).not_to be :empty?
  end

  it 'has at least one description' do
    expect(
      pokemon.description
    ).not_to be :empty?
  end

  it 'has at least one genera' do
    expect(
      pokemon.genera
    ).not_to be :empty?
  end

  it 'has at least one generation_name' do
    expect(
      pokemon.generation_name
    ).not_to be :empty?
  end

  it 'has evolution chain' do
    expect(
      pokemon.evolution_chain
    ).not_to be nil
  end

  it 'must respond to methods' do
    expect(pokemon).to respond_to(
      :id, :names, :generas, :descriptions, :is_baby,
      :sprite, :capture_rate, :evolution_chain_url,
      :egg_groups, :generation_name
    )
  end
end
