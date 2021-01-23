require 'rspec'
require_relative 'pascals_triangle.rb'

describe TriangleGenerator do
  it 'returns by index 0' do
    expect(TriangleGenerator.get(0).last).to eq '1'
  end

  it 'returns by index 1' do
    expect(TriangleGenerator.get(1).last).to eq '1 1'
  end

  it 'returns by index 2' do
    expect(TriangleGenerator.get(2).last).to eq '1 2 1'
  end

  it 'returns by index 3' do
    expect(TriangleGenerator.get(3).last).to eq '1 3 3 1'
  end

  it 'returns by index 4' do
    expect(TriangleGenerator.get(12).last).to eq '1 12 66 220 495 792 924 792 495 220 66 12 1'
  end
end
