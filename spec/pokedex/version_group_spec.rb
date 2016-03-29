require 'spec_helper'

describe Pokedex::VersionGroup do
  before do
    VCR.insert_cassette 'version_group', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:region) { Pokedex::VersionGroup.find(1) }

  it 'has a id number' do
    expect(
      region.id
    ).to be > 0
  end

  it 'has name' do
    expect(
      region.name
    ).not_to be :empty?
  end
end
