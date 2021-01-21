require 'rspec'
require_relative 'sequence.rb'

describe SequenceGenerator do
  it 'returns by index 0' do
    expect(SequenceGenerator.get_str_by_index(0)).to eq '1'
  end
  it 'returns by index 1' do
    expect(SequenceGenerator.get_str_by_index(1)).to eq '11'
  end
  it 'returns by index 2' do
    expect(SequenceGenerator.get_str_by_index(2)).to eq '21'
  end
  it 'returns by index 3' do
    expect(SequenceGenerator.get_str_by_index(3)).to eq '1211'
  end
  it 'returns by index 4' do
    expect(SequenceGenerator.get_str_by_index(4)).to eq '111221'
  end
  it 'returns by index 5' do
    expect(SequenceGenerator.get_str_by_index(5)).to eq '312211'
  end
end
