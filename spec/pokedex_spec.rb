require 'spec_helper'

describe Pokedex do
  it 'has a version number' do
    expect(Pokedex::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  it 'timeout config works' do
    timeout = rand 100
    Pokedex.timeout = timeout
    expect(Pokedex.timeout).to eq(timeout)
  end
end
