require 'rspec'
require_relative 'pascals_triangle.rb'

describe TriangleGenerator do
  it 'returns by index 0' do
    expect(TriangleGenerator.get_str_by_index(0)).to eq '1'
  end
  it 'returns by index 1' do
    expect(TriangleGenerator.get_str_by_index(1)).to eq '1 1'
  end
  it 'returns by index 2' do
    expect(TriangleGenerator.get_str_by_index(2)).to eq '1 2 1'
  end
  it 'returns by index 3' do
    expect(TriangleGenerator.get_str_by_index(3)).to eq '1 3 3 1'
  end
  it 'returns by index 4' do
    expect(TriangleGenerator.get_str_by_index(12)).to eq '1 12 66 220 495 792 924 792 495 220 66 12 1'
  end
end
