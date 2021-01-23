require 'rspec'
require_relative 'sequence.rb'

describe SequenceGenerator do
  it 'returns by index 0' do
    expect(SequenceGenerator.get(0).last).to eq '1'
  end

  it 'returns by index 1' do
    expect(SequenceGenerator.get(1).last).to eq '11'
  end

  it 'returns by index 2' do
    expect(SequenceGenerator.get(2).last).to eq '21'
  end

  it 'returns by index 5' do
    expect(SequenceGenerator.get(5).last).to eq '312211'
  end

  it 'checking different elements' do
    seq = SequenceGenerator.get(5)

    expect(seq[0]).to eq '1'
    expect(seq[3]).to eq '1211'
    expect(seq[4]).to eq '111221'
  end
end
