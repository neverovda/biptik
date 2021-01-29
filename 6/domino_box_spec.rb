require 'rspec'
require_relative 'domino_box.rb'

describe DominoBox do
  it 'suitable combination [2|1], [2|3] и [1|3]' do
    r1 = [[1, 2], [2, 3], [3, 1]]
    r2 = [[3, 2], [2, 1], [1, 3]]
    r3 = [[1, 3], [3, 2], [2, 1]]
    r4 = [[2, 1], [1, 3], [3, 2]]
    expect([r1, r2, r3, r4]).to include(DominoBox.new([2, 1], [2, 3], [1, 3]).chain)
  end

  it 'difficult combination witch 3 circles ' do
    chain = DominoBox.new([1, 5], [5, 1], [4, 2], [2, 4], [5, 8], [8, 2], [2, 5]).chain
    expect(chain).to be_an_instance_of(Array)
    expect(chain.size).to eq(7)
    expect(chain).to_not be_empty
  end

  it 'zero domino' do
    expect(DominoBox.new.chain).to be_nil
  end

  it 'bad combination [1|2], [4|1] и [2|3]' do
    expect(DominoBox.new([1, 2], [4, 1], [2, 3]).chain).to be_nil
  end
end
