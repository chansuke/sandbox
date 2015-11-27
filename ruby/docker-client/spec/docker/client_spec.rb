require 'spec_helper'

describe Docker::Client do
  it 'has a version number' do
    expect(Docker::Client::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
