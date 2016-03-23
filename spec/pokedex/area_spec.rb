require 'spec_helper'

describe Pokedex::Area do
  before do
    VCR.insert_cassette 'area', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:area) { Pokedex::Area.find(1) }

  it 'has a id number' do
    expect(
      area.id
    ).to be > 0
  end

  it 'has at least one name' do
    expect(
      area.name
    ).not_to be :empty?
  end
end
