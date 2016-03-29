require 'spec_helper'

describe Pokedex::Region do
  before do
    VCR.insert_cassette 'region', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:region) { Pokedex::Region.find(1) }

  it 'has a id number' do
    expect(
      region.id
    ).to be > 0
  end

  it 'has at least one name' do
    expect(
      region.name
    ).not_to be :empty?
  end

  it 'has at least one version_group' do
    expect(
      region.version_groups
    ).not_to be :empty?

    region.version_groups.each do |version_group|
      expect(
        version_group.class
      ).to be Pokedex::VersionGroup
    end
  end
end
