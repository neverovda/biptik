require 'rspec'
require_relative 'chess.rb'

describe Chess do
  it 'queens on one line x' do
    expect(Chess.new('b2', 'h2').strike?).to be_truthy
  end

  it 'queens on one line y' do
    expect(Chess.new('d2', 'd7').strike?).to be_truthy
  end

  it 'queens on one ascending dioganal' do
    expect(Chess.new('d2', 'g5').strike?).to be_truthy
  end

  it 'queens on one downward dioganal' do
    expect(Chess.new('b6', 'f2').strike?).to be_truthy
  end

  it 'without striking position d2 and f6' do
    expect(Chess.new('d2', 'g6').strike?).to be_falsey
  end

  it 'without striking position c7 and e8' do
    expect(Chess.new('c7', 'e8').strike?).to be_falsey
  end
end
