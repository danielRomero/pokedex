require 'spec_helper'

describe Pokedex::EvolutionChain do
  before do
    VCR.insert_cassette 'evolution_chain', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:evolution_chain) { Pokedex::EvolutionChain.find(1) }

  it 'has a id number' do
    expect(
      evolution_chain.id
    ).to be > 0
  end
end
