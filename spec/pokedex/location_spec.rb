require 'spec_helper'

describe Pokedex::Location do
  before do
    VCR.insert_cassette 'location', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:location) { Pokedex::Location.find(1) }

  it 'has a id number' do
    expect(
      location.id
    ).to be > 0
  end

  it 'has at least one name' do
    expect(
      location.name
    ).not_to be :empty?
  end
end
